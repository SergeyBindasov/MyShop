//
//  MSProductInfoCollectionViewCell.swift
//  MyShop
//
//  Created by Sergey on 11.02.2023.
//

import UIKit

final class MSProductInfoCollectionViewCell: UICollectionViewCell {
    static let identifier = "infoCell"
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .natural
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let brandLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let oldpriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let discountTagLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .systemRed
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let brandImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "brand")
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let starsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "stars")
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubviews(descriptionLabel, brandLabel, ratingLabel, priceLabel,oldpriceLabel, discountTagLabel, brandImageView, starsImageView)
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        descriptionLabel.text = nil
        brandLabel.text = nil
        ratingLabel.text = nil
        priceLabel.text = nil
        oldpriceLabel.text = nil
        discountTagLabel.text = nil
    }
    
    public func configure(with product: MSProduct) {
        descriptionLabel.text = product.description.capitalized
        brandLabel.text = "Brand: \(product.brand.capitalized)"
        ratingLabel.text = "User rating: \(String(product.rating))"
        priceLabel.text = "Total: \(String(product.price))" + " " + "$"
        oldpriceLabel.text = "Old price: \(String.getInitialPrice(with: product.price, with: product.discountPercentage))" + " " + "$"
        discountTagLabel.text = "-" + " " + String(Int(product.discountPercentage)) + " " + "%"
    }
        
    private func setupLayout() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            
            brandImageView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            brandImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            brandImageView.widthAnchor.constraint(equalToConstant: 70),
            brandImageView.heightAnchor.constraint(equalToConstant: 20),
            
            starsImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            starsImageView.centerYAnchor.constraint(equalTo: brandImageView.centerYAnchor),
            starsImageView.widthAnchor.constraint(equalToConstant: 100),
            starsImageView.heightAnchor.constraint(equalToConstant: 20),
            
            
            brandLabel.topAnchor.constraint(equalTo: brandImageView.bottomAnchor, constant: 5),
            brandLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            
            ratingLabel.centerYAnchor.constraint(equalTo: brandLabel.centerYAnchor),
            ratingLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            priceLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            
            oldpriceLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: -15),
            oldpriceLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            
            discountTagLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            discountTagLabel.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor)
        ])
    }
}
