//
//  MSWishlistCell.swift
//  MyShop
//
//  Created by Sergey on 22.02.2023.
//

import UIKit

final class MSWishlistCell: UITableViewCell {
    
    static let identifier = "wishlistCell"
    
    let viewModel = MSWishlistCellViewModel()

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
        likedCollection.delegate = viewModel
        likedCollection.dataSource = viewModel
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



