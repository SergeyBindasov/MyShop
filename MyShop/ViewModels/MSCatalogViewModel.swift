//
//  MSCatalogViewModel.swift
//  MyShop
//
//  Created by Sergey on 02.02.2023.
//

import UIKit

final class MSCatalogViewModel {
    
    enum SectionType {
            case promo
            case categories
        }
    public var sections: [SectionType] = []
    
    init() {
            setupSections()
        }
    
    private func setupSections() {
            sections = [
                .promo,
                .categories
            ]
    }
    
    // MARK: - Layouts
        
    public func createPromoSectionLayout() -> NSCollectionLayoutSection {
        
        let item = NSCollectionLayoutItem(layoutSize:
                                            NSCollectionLayoutSize(
                                                widthDimension: .fractionalWidth(1.0),
                                                heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 10,
            leading: 5,
            bottom: 10,
            trailing: 8)
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.8),
                heightDimension: .absolute(150)),
            subitems: [item])
       let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
        
        public func createCategoriesSectionLayout() -> NSCollectionLayoutSection {
            
            let item = NSCollectionLayoutItem(layoutSize:
                                                NSCollectionLayoutSize(
                                                    widthDimension: .fractionalWidth(0.5),
                                                    heightDimension: .fractionalHeight(1.0)))
            item.contentInsets = NSDirectionalEdgeInsets(
                top: 2,
                leading: 2,
                bottom: 2,
                trailing: 2)
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(150)),
                subitems: [item, item])
           let section = NSCollectionLayoutSection(group: group)
           
            return section
        }
    
}
        

