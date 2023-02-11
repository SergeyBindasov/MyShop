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
        label.text = "SIM-Free, Model A19211 6.5-inch Super Retina HD display with OLED technology A12 Bionic chip with ..."
        label.textAlignment = .natural
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let brandLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .label
        label.numberOfLines = 0
        label.text = "Brand: Apple"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .label
        label.numberOfLines = 0
        label.text = "User rating: 4.45"
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let oldpriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        label.text = "Old price: 745 $"
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .label
        label.numberOfLines = 0
        label.text = "Total: 546 $"
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let discountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        label.textColor = .systemRed
        label.numberOfLines = 0
        label.text = "Discount"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let discountTagLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .systemRed
        label.numberOfLines = 0
        label.text = "17 %"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubviews(descriptionLabel, brandLabel, ratingLabel, priceLabel,oldpriceLabel, discountLabel, discountTagLabel)
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            
            brandLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 15),
            brandLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            
            ratingLabel.centerYAnchor.constraint(equalTo: brandLabel.centerYAnchor),
            ratingLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            priceLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            
            oldpriceLabel.bottomAnchor.constraint(equalTo: priceLabel.topAnchor, constant: -15),
            oldpriceLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            
            discountLabel.centerYAnchor.constraint(equalTo: oldpriceLabel.centerYAnchor),
            discountLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            
            discountTagLabel.centerXAnchor.constraint(equalTo: discountLabel.centerXAnchor),
            discountTagLabel.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor)
        ])
    }
}
