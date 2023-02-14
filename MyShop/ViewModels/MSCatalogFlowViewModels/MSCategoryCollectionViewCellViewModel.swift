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
    
    public func fetchImage(complition: @escaping(Result<Data, Error>) -> Void) {
            
            guard let url = URL(string: thumbnail) else {
                complition(.failure(URLError(.badURL)))
                return
            }
            MSImageLoader.shared.downloadImage(url, complition: complition)
        }
}
