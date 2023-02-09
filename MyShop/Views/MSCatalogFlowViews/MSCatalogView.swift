//
//  MSCatalogView.swift
//  MyShop
//
//  Created by Sergey on 02.02.2023.
//

import UIKit

final class MSCatalogView: UIView {
    
    public var collectionView: UICollectionView?
    
    private let viewModel: MSCatalogViewModel
    
    init(frame: CGRect, viewModel: MSCatalogViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        let collectionView = createCollectionView()
        self.collectionView = collectionView
        addSubviews(collectionView)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
    
    private func addConstraints() {
        guard let collectionView = collectionView else { return }
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func createCollectionView() -> UICollectionView {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            return self.createSection(for: sectionIndex)
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(MSOffersHeaderViewCell.self, forCellWithReuseIdentifier:MSOffersHeaderViewCell.identifier)
        
        collectionView.register(MSPromoCollectionViewCell.self, forCellWithReuseIdentifier:MSPromoCollectionViewCell.identifier)
        collectionView.register(MSCatalogHeaderViewCell.self, forCellWithReuseIdentifier:MSCatalogHeaderViewCell.identifier)
        collectionView.register(MSCategoriesCollectionViewCell.self, forCellWithReuseIdentifier: MSCategoriesCollectionViewCell.identifier)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }
    
    private func createSection(for sectionIndex: Int) -> NSCollectionLayoutSection {
        let sectionType = viewModel.sections
        switch sectionType[sectionIndex] {
        case.firstHeader:
            return viewModel.createHeaderSectionLayout()
        case .promo:
            return viewModel.createPromoSectionLayout()
        case .secondHeader:
            return viewModel.createSecondHeaderSectionLayout()
        case .categories:
            return viewModel.createCategoriesSectionLayout()
        }
    }
}
