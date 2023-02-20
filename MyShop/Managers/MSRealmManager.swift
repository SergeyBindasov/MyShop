//
//  MSRealmManager.swift
//  MyShop
//
//  Created by Sergey on 17.02.2023.
//

import Foundation
import RealmSwift

final class MSRealmManager {
    static let shared = MSRealmManager()
    let realm = try! Realm()
    var products: Results<MSSavedProduct>?
    
    private init() {}
    
    func saveProduct(product: MSSavedProduct) {
        do {
            try realm.write({
                realm.add(product)
            })
            
        } catch {
            print ("error saving context \(error)")
        }
    }
    
    func loadSavedProducts() -> Results<MSSavedProduct> {
        let products = realm.objects(MSSavedProduct.self)
        return products
    }
    
    func destroy(at indexPath: Int) {
        if let product = products?[indexPath] {
            do {
                try realm.write({
                    realm.delete(product)
                })
            } catch{
                print("Error deleting item \(error)")
            }
        }
    }
}
