//
//  MSProduct.swift
//  MyShop
//
//  Created by Sergey on 30.01.2023.
//

import Foundation

struct MSGetAllProdactInfo: Codable {
    let products: [MSProduct]
    let total: Int
    let skip: Int
    let limit: Int
}

struct MSProduct: Codable {
    let id: Int
    let title: String
    let description: String
    let price: Int
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String
    let category: String
    let thumbnail: String
    let images: [String]
}
