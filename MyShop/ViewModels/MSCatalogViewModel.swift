//
//  MSCatalogViewModel.swift
//  MyShop
//
//  Created by Sergey on 02.02.2023.
//

import UIKit

final class MSCatalogViewModel {
    
    enum SectionType {
        case firstHeader
        case promo
        case secondHeader
        case categories
        }
    public var sections: [SectionType] = []
    
    init() {
            setupSections()
        }
    
    private func setupSections() {
            sections = [
                .firstHeader,
                .promo,
                .secondHeader,
                .categories
               
            ]
    }
    
    // MARK: - Layouts
    
    public func createHeaderSectionLayout() -> NSCollectionLayoutSection {
        

        
        let item = NSCollectionLayoutItem(layoutSize:
                                            NSCollectionLayoutSize(
                                                widthDimension: .fractionalWidth(1.0),
                                                heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 15,
            bottom: 0,
            trailing: 0)
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(40)),
            subitems: [item])
       let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
        
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
    
    public func createSecondHeaderSectionLayout() -> NSCollectionLayoutSection {
        

        
        let item = NSCollectionLayoutItem(layoutSize:
                                            NSCollectionLayoutSize(
                                                widthDimension: .fractionalWidth(1.0),
                                                heightDimension: .fractionalHeight(1.0)))
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 10,
            leading: 15,
            bottom: 10,
            trailing: 0)
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(60)),
            subitems: [item])
       let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
        
        public func createCategoriesSectionLayout() -> NSCollectionLayoutSection {
            
            let item = NSCollectionLayoutItem(layoutSize:
                                                NSCollectionLayoutSize(
                                                    widthDimension: .fractionalWidth(0.25),
                                                    heightDimension: .fractionalHeight(1.0)))
            item.contentInsets = NSDirectionalEdgeInsets(
                top: 2,
                leading: 2,
                bottom: 2,
                trailing: 2)
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(140)),
                subitems: [item, item])
           let section = NSCollectionLayoutSection(group: group)
           
            return section
        }
    
}
        

