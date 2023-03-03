//
//  MSSavedCustomer.swift
//  MyShop
//
//  Created by Sergey on 03.03.2023.
//

import Foundation
import RealmSwift

final class MSSavedCustomer: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var age: Int = 0
    @objc dynamic var gender: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var phone: String = ""
    @objc dynamic var username: String = ""
    @objc dynamic var password: String = ""
    @objc dynamic var image: String = ""
    var address = List<SavedAddress>()
    var bank = List<SavedBank>()
}

class SavedAddress: Object {
    @objc dynamic var address: String = ""
    @objc dynamic var city: String = ""
    @objc dynamic var postalCode: String = ""
    @objc dynamic var state: String = ""
    let parentCategory = LinkingObjects(fromType: MSSavedCustomer.self, property: "address")
}

class SavedBank: Object {
    @objc dynamic var cardExpire: String = ""
    @objc dynamic var cardNumber: String = ""
    @objc dynamic var cardType: String = ""
    @objc dynamic var currency: String = ""
    @objc dynamic var iban: String = ""
    let parentCategory = LinkingObjects(fromType: MSSavedCustomer.self, property: "bank")
}
