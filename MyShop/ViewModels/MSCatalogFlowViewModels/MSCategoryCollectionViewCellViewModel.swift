//
//  MSCategoryCollectionViewCellViewModel.swift
//  MyShop
//
//  Created by Sergey on 08.02.2023.
//

import Foundation

final class MSCategoryCollectionViewCellViewModel {
    
    let title: String
    let price: Int
    let discountPercentage: Double
    let brand: String
    let thumbnail: String
    
    init(
        title: String,
        price: Int,
        discountPercentage: Double,
        brand: String,
        thumbnail: String
    ) {
        self.title = title
        self.price = price
        self.discountPercentage = discountPercentage
        self.brand = brand
        self.thumbnail = thumbnail
    }
}
