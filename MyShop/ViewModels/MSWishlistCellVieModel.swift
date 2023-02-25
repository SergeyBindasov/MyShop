//
//  MSWishlistCellVieModel.swift
//  MyShop
//
//  Created by Sergey on 23.02.2023.
//

import UIKit
import RealmSwift

final class MSWishlistCellVieModel: NSObject {
    let realm = try! Realm()
    var products: Results<MSLikedProduct>?

    override init() {
        super.init()
        products = realm.objects(MSLikedProduct.self)
    }
}

extension MSWishlistCellVieModel: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return products?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MSLikedProductCell.identifier, for: indexPath) as? MSLikedProductCell else { fatalError()}
        DispatchQueue.main.async { [weak self] in
            self?.products = self?.realm.objects(MSLikedProduct.self)
            if let safeProduct = self?.products {
                let array = Array(safeProduct)
                if indexPath.row < (self?.products!.count)! {
                    cell.configure(with: array[indexPath.row])
                }
            }
        }
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
}
