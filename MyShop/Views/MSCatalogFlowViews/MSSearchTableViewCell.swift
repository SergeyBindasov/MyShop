//
//  MSSearchTableViewCell.swift
//  MyShop
//
//  Created by Sergey on 12.02.2023.
//

import UIKit

final class MSSearchTableViewCell: UITableViewCell {
    
    static let identifier = "searchCell"
    
    private let productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .label
        label.numberOfLines = 1
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .label
        label.numberOfLines = 1
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
       
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(productImage, nameLabel, priceLabel)
        setupConstraints()
        
    }
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
    
    public func configure(with product: MSProduct) {
        nameLabel.text = product.title
        priceLabel.text = "\(String(product.price))" + " " + "$"
        productImage.downloaded(from: product.thumbnail)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            productImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            productImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            productImage.heightAnchor.constraint(equalToConstant: 50),
            productImage.widthAnchor.constraint(equalToConstant: 50),
            
            nameLabel.leftAnchor.constraint(equalTo: productImage.rightAnchor, constant: 10),
            nameLabel.centerYAnchor.constraint(equalTo: productImage.centerYAnchor),
            
            priceLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            priceLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10)
        ])
    }
}
