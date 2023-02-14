//
//  MSSearchTableViewCellViewModel.swift
//  MyShop
//
//  Created by Sergey on 14.02.2023.
//

import Foundation

final class MSSearchTableViewCellViewModel {
    
    private let productImageUrlString: String?
    
    init(
            productImageUrlString: String?
        ) {
            self.productImageUrlString = productImageUrlString
            
        }
    
    public func fetchImage(complition: @escaping(Result<Data, Error>) -> Void) {
            
            guard let url = URL(string: productImageUrlString!) else {
                complition(.failure(URLError(.badURL)))
                return
            }
            MSImageLoader.shared.downloadImage(url, complition: complition)

        }
}
