//
//  MSRequest.swift
//  MyShop
//
//  Created by Sergey on 30.01.2023.
//

import Foundation

final class MSRequest {

    enum URLS {
        static let productUrl = "https://dummyjson.com/products"
        static let customerUrl = "https://dummyjson.com/users/"
        static let searchUrl = "https://dummyjson.com/products/search?q="
    }
    
    private let urlPath: String?
        
    private struct Constants {
        
        /// API Constant
        static let baseUrl = ""
    }
    
    init (urlPath: String) {
        self.urlPath = urlPath
    }
    
    public var url: URL? {
        return URL(string: Constants.baseUrl+(urlPath ?? ""))
    
    }
    public let httpMethod = "GET"
}
