//
//  MSWishlistCellVieModel.swift
//  MyShop
//
//  Created by Sergey on 23.02.2023.
//

import UIKit
import RealmSwift

protocol MSWishlistCellViewModelDelegate: AnyObject {
    func didTapOnLikedProduct(at number: Int, forModel viewModel: MSWishlistCellViewModel, forCell cell: MSLikedProductCell, controller: MSProfileViewController)
}

final class MSWishlistCellViewModel: NSObject {
    let realm = try! Realm()
    var products: Results<MSLikedProduct>?
    weak var profileView: MSProfileView?
    
    weak var delegate: MSWishlistCellViewModelDelegate?
    weak var profileVC: MSProfileViewController?

    override init() {
        super.init()
        products = realm.objects(MSLikedProduct.self)
    }
    
   
}

extension MSWishlistCellViewModel: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MSLikedProductCell.identifier, for: indexPath) as? MSLikedProductCell else { fatalError()}
        // Не понимаю почему делегат не работает
        delegate?.didTapOnLikedProduct(at: indexPath.row, forModel: self, forCell: cell, controller: profileVC!)
   
    }
}
