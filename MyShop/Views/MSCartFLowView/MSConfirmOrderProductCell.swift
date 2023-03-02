//
//  MSConfirmOrderProductCell.swift
//  MyShop
//
//  Created by Sergey on 02.03.2023.
//

import UIKit

final class MSConfirmOrderProductCell: UITableViewCell {
    static let identifier = "confirmOrderProductCell"
    
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
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let quantityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.layer.masksToBounds = true
        label.textColor = .label
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBackground
        contentView.addSubviews(productImage, nameLabel, quantityLabel, priceLabel)
        setupLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
    
    func configure(with product: MSSavedProduct) {
        let imageViewModel = MSImageForCellViewModel(productImageUrlString: product.url)
        imageViewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.productImage.image = image
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
        }
        nameLabel.text = product.title
        quantityLabel.text = String(product.quantity)
        priceLabel.text = String(product.price * product.quantity) + " " + "$"
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            productImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            productImage.widthAnchor.constraint(equalToConstant: 70),
            productImage.heightAnchor.constraint(equalToConstant: 70),
            nameLabel.centerYAnchor.constraint(equalTo: productImage.centerYAnchor),
            nameLabel.leftAnchor.constraint(equalTo: productImage.rightAnchor, constant: 10),
            nameLabel.heightAnchor.constraint(equalToConstant: 70),
            nameLabel.widthAnchor.constraint(equalToConstant: 180),
            priceLabel.centerYAnchor.constraint(equalTo: productImage.centerYAnchor),
            priceLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            quantityLabel.centerYAnchor.constraint(equalTo: productImage.centerYAnchor),
            quantityLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -85)
        ])
    }
}
