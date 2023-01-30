//
//  MSRequest.swift
//  MyShop
//
//  Created by Sergey on 30.01.2023.
//

import Foundation

final class MSRequest {
 
    private struct Constants {
        
        /// API Constant
        static let baseUrl = "https://dummyjson.com/products"
    }
    
    public var url: URL? {
        return URL(string: Constants.baseUrl)
       }
    
    public let httpMethod = "GET"
}
