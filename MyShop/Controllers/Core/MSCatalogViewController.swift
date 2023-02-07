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
        view.addSubview(catalogView)
        setupLayout()
        catalogView.collectionView?.delegate = self
        catalogView.collectionView?.dataSource = self

        
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            catalogView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            catalogView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            catalogView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            catalogView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
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
            return PromoPics.all.count
        case .secondHeader:
            return 1
        case .categories:
            return CategoryPics.all.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 3 {
            let categoryVC = MSCategoryViewController(category: catergory[indexPath.row], viewModel: MSCategoryViewModel(category: catergory[indexPath.row]))
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
            cell.configure(with: PromoPics.all[indexPath.row]!)
            return cell
        case .secondHeader:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MSCatalogHeaderViewCell.identifier, for: indexPath) as? MSCatalogHeaderViewCell else { fatalError() }
            cell.configure()
            return cell
        case .categories:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MSCategoriesCollectionViewCell.identifier, for: indexPath) as? MSCategoriesCollectionViewCell else { fatalError() }
                    MSService.shared.makeCategoryRequest(with: request, complition: { [weak self] result in
                               switch result {
                               case .success(let sucssess):
                                   self?.catergory = sucssess
                                   cell.configure(with: sucssess[indexPath.row], categoryPic: CategoryPics.all[indexPath.row]!)
                               case .failure(let error):
                                   print(error)
                               }
                    })
            return cell
        }
    }
}
