//
//  MSWishlistCell.swift
//  MyShop
//
//  Created by Sergey on 22.02.2023.
//

import UIKit
import RealmSwift

typealias LikedProductClosure = (( _ tableIndex: Int, _ collectionIndex: Int?) -> Void)

final class MSWishlistCell: UITableViewCell {
    
    static let identifier = "wishlistCell"
    let realm = try! Realm()
    var products: Results<MSLikedProduct>?
    var index = 3
    var didSelectClosure: LikedProductClosure?
    
    lazy var likedCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        layout.scrollDirection = .horizontal
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(MSLikedProductCell.self, forCellWithReuseIdentifier: MSLikedProductCell.identifier)
        collection.backgroundColor = .systemBackground
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBackground
        contentView.addSubviews(likedCollection)
        setupLayout()
        products = realm.objects(MSLikedProduct.self)
        likedCollection.delegate = self
        likedCollection.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 180),
            likedCollection.topAnchor.constraint(equalTo: contentView.topAnchor),
            likedCollection.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            likedCollection.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            likedCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

extension MSWishlistCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectClosure?(index, indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
}



