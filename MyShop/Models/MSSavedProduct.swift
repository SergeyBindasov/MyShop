//
//  MSSavedProducts.swift
//  MyShop
//
//  Created by Sergey on 17.02.2023.
//

import Foundation
import RealmSwift

final class MSSavedProduct: Object {
    @objc dynamic var id = 0
    @objc dynamic var quantity = 0
    @objc dynamic var title = ""
    @objc dynamic var url = ""
    
}
