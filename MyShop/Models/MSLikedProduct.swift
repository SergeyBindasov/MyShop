//
//  MSLikedProduct.swift
//  MyShop
//
//  Created by Sergey on 22.02.2023.
//

import Foundation
import RealmSwift

final class MSLikedProduct: Object {
    @objc dynamic var id = 0
    @objc dynamic var isLiked = false
    @objc dynamic var title = ""
    @objc dynamic var url = ""
}
