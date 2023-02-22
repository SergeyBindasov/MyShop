//
//  MSCustomer.swift
//  MyShop
//
//  Created by Sergey on 20.02.2023.
//

import Foundation

struct MSCustomer: Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let age: Int
    let gender: String
    let email: String
    let phone: String
    let username: String
    let password: String
    let image: String
    let address: Address
    let bank: Bank

}

struct Address: Codable {
    let address: String
    let city: String
    let postalCode: String
    let state: String
    let coordinates: Coordinates
}

struct Coordinates: Codable {
    let lat: Double
    let lng: Double
}

struct Bank: Codable {
    let cardExpire: String
    let cardNumber: String
    let cardType: String
    let currency: String
    let iban: String 
}
