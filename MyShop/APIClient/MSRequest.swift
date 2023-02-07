//
//  MSRequest.swift
//  MyShop
//
//  Created by Sergey on 30.01.2023.
//

import Foundation

final class MSRequest {
    
    private let urlPath: String?
    
    private struct Constants {
      
        /// API Constant
        static let baseUrl = "https://dummyjson.com/products"
    }
    init (urlPath: String) {
        self.urlPath = urlPath
    }
    
    public var url: URL? {
        return URL(string: Constants.baseUrl+(urlPath ?? ""))
       }
    
    public let httpMethod = "GET"
}
