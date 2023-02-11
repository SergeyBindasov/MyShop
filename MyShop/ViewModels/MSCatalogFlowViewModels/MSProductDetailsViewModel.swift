//
//  MSProductDetailsViewModel.swift
//  MyShop
//
//  Created by Sergey on 09.02.2023.
//

import UIKit

final class MSProductDetailsViewModel: NSObject {
    
    enum SectionType {
        case productGallery
        case productInfo
    }
    
    public var sections: [SectionType] = []
    
    override init() {
        super.init()
        setupSections()
    }
    
    public func setupSections() {
        sections = [
            .productGallery,
            .productInfo
        ]
    }
    
    public func createGallerySectionLayout() -> NSCollectionLayoutSection {
        
        let sectionBackground = NSCollectionLayoutDecorationItem.background(
                            elementKind: "background")
        
        let item = NSCollectionLayoutItem(layoutSize:
                                            NSCollectionLayoutSize(
                                                widthDimension: .fractionalWidth(1.0),
                                                heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 10,
            leading: 5,
            bottom: 10,
            trailing: 8)
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.8),
                heightDimension: .absolute(300)),
            subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.decorationItems = [sectionBackground]
       
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    
    public func createInfoSectionLayout() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize:
                                            NSCollectionLayoutSize(
                                                widthDimension: .fractionalWidth(1.0),
                                                heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 10,
            leading: 15,
            bottom: 10,
            trailing: 15)

        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(250)),
            subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
}

extension MSProductDetailsViewModel: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = sections[section]
        switch sectionType {
        case .productGallery:
            return 6
        case .productInfo:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let sectionType = sections[indexPath.section]
        switch sectionType {
        case .productGallery:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            cell.backgroundColor = .red
            return cell
            
        case .productInfo:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath)
            cell.backgroundColor = .blue
            return cell
        }
    }
}
