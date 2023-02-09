//
//  MSCatalogViewController.swift
//  MyShop
//
//  Created by Sergey on 30.01.2023.
//

import UIKit

final class MSCatalogViewController: UIViewController {
    
    let request = MSRequest(urlPath: "/categories")
    var catergory: [String] = []
    
    private let viewModel = MSCatalogViewModel()
    private let catalogView: MSCatalogView
    
    private let spinner: UIActivityIndicatorView = {
           let spinner = UIActivityIndicatorView(style: .large)
           spinner.hidesWhenStopped = true
           spinner.translatesAutoresizingMaskIntoConstraints = false
           return spinner
       }()
    
    init() {
        self.catalogView = MSCatalogView(frame: .zero, viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My shop"
        view.addSubviews(catalogView, spinner)
        setupLayout()
        startLoading()
        
        catalogView.collectionView?.delegate = self
        catalogView.collectionView?.dataSource = self
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            catalogView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            catalogView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            catalogView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            catalogView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func startLoading() {
        catalogView.collectionView?.isHidden = true
        catalogView.collectionView?.alpha = 0
        spinner.startAnimating()
    }
}

// MARK: - Collection View

extension MSCatalogViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = viewModel.sections[section]
        switch sectionType {
        case .firstHeader:
            return 1
        case .promo:
            return AssetPicsStrings.promo.count
        case .secondHeader:
            return 1
        case .categories:
            return AssetPicsStrings.category.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 3 {
            let categoryVC = MSCategoryViewController(category: catergory[indexPath.row])
        navigationController?.pushViewController(categoryVC, animated: true)
        }
    }
    
  
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = viewModel.sections[indexPath.section]
        switch sectionType {
        case.firstHeader:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MSOffersHeaderViewCell.identifier, for: indexPath) as? MSOffersHeaderViewCell else { fatalError() }
            cell.configure()
            return cell
        case .promo:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MSPromoCollectionViewCell.identifier, for: indexPath) as? MSPromoCollectionViewCell else { fatalError() }
            cell.configure(with: UIImage.getImagesByNames(names: AssetPicsStrings.promo)[indexPath.row])
            return cell
        case .secondHeader:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MSCatalogHeaderViewCell.identifier, for: indexPath) as? MSCatalogHeaderViewCell else { fatalError() }
            cell.configure()
            return cell
        case .categories:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MSCategoriesCollectionViewCell.identifier, for: indexPath) as? MSCategoriesCollectionViewCell else { fatalError() }
                    MSService.shared.makeCategoryRequest(with: request, completion: { [weak self] result in
                               switch result {
                               case .success(let sucssess):
                                   self?.catergory = sucssess
                                   DispatchQueue.main.async {
                                       cell.configure(with: sucssess[indexPath.row], categoryPic: UIImage.getImagesByNames(names: AssetPicsStrings.category)[indexPath.row])
                                       self?.spinner.stopAnimating()
                                       self?.catalogView.collectionView?.isHidden = false
                                       UIView.animate(withDuration: 0.4) {
                                           self?.catalogView.collectionView?.alpha = 1
                                       }
                                   }
                                   
                               case .failure(let error):
                                   print(error)
                               }
                    })
            return cell
        }
    }
}
