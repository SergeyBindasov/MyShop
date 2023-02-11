//
//  MsProductsCollectionViewCell.swift
//  MyShop
//
//  Created by Sergey on 08.02.2023.
//

import UIKit

final class MSProductsCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "MsProductsCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .label
        label.numberOfLines = 1
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let brandLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .secondaryLabel
        label.numberOfLines = 1
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let discountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .white
        label.backgroundColor = .systemRed
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubviews(imageView, nameLabel, brandLabel, priceLabel, discountLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLabel.text = nil
        brandLabel.text = nil
        priceLabel.text = nil
        discountLabel.text = nil
        
    }
    
    public func configure(with viewModel: MSCategoryCollectionViewCellViewModel) {
        nameLabel.text = viewModel.title
        brandLabel.text = viewModel.brand
        priceLabel.text = String(viewModel.price) + " " + "$"
        discountLabel.text = String(Int(viewModel.discountPercentage)) + " " + "%"
        imageView.downloaded(from: viewModel.thumbnail)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 180),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            
            
            brandLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            brandLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            brandLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            brandLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            
            priceLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            
            discountLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            discountLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            discountLabel.widthAnchor.constraint(equalToConstant: 45),
            discountLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}

