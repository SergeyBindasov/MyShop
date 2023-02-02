//
//  MSCatalogViewController.swift
//  MyShop
//
//  Created by Sergey on 30.01.2023.
//

import UIKit

final class MSCatalogViewController: UIViewController {
    
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
        title = "All goods"
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
        case .promo:
            return PromoPics.all.count
        case .categories:
            return 18
            
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = viewModel.sections[indexPath.section]
        switch sectionType {
            
        case .promo:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MSPromoCollectionViewCell.identifier, for: indexPath) as? MSPromoCollectionViewCell else { fatalError() }
            cell.configure(with: PromoPics.all[indexPath.row]!)
            return cell
        case .categories:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath)
            cell.backgroundColor = .systemTeal
            return cell
        }
    }
}


//let request = MSRequest()
//var products: [MSGetAllProdactInfo] = []
//        MSService.shared.execute(request,
//                                 expecting: MSGetAllProdactInfo.self) { [weak self] result in
//
//            switch result {
//            case .success(let sucssess):
//                let array = sucssess.products
//               print(array)
//            case .failure(let error):
//                print(error)
//            }
//
//            }
