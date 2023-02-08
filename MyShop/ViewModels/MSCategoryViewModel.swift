//
//  MSCategoryViewModel.swift
//  MyShop
//
//  Created by Sergey on 07.02.2023.
//

import Foundation

final class MSCategoryViewModel {
    
    private var category: String
    
    private var products: [MSProduct] = [] {
        didSet {
            for product in products {
                
                
            }
        }
    }
    
    init (category: String) {
        self.category = category
    }
    public func fetchProducts() {
        MSService.shared.execute(MSRequest(urlPath: "/category/"+category), expecting: MSGetAllProdactInfo.self) { [weak self] result in
            switch result {
            case .success(let response):
                print(response.products)
                
            case .failure(let error):
                print(String(describing: error))
            }
            }
    }
    

    
}
