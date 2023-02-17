//
//  MSCartTableViewCell.swift
//  MyShop
//
//  Created by Sergey on 17.02.2023.
//

import UIKit

final class MSCartTableViewCell: UITableViewCell {
    
    static let identifier = "cartCell"
    
    private let productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .label
        label.numberOfLines = 1
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let quantityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
        label.layer.cornerRadius = 15
        label.layer.masksToBounds = true
        label.textColor = .label
        label.backgroundColor = .systemMint
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 1
        stepper.maximumValue = 99
        stepper.wraps = false
        stepper.autorepeat = true
        stepper.translatesAutoresizingMaskIntoConstraints = false
        return stepper
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(productImage, nameLabel, quantityLabel, stepper)
        setupConstraints()
        
    }
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
    
    func configure(with product: MSSavedProduct) {
        nameLabel.text = product.title
        quantityLabel.text = String(product.quantity)
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
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            productImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            productImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            productImage.heightAnchor.constraint(equalToConstant: 65),
            productImage.widthAnchor.constraint(equalToConstant: 65),
            
            nameLabel.centerYAnchor.constraint(equalTo: productImage.centerYAnchor),
            nameLabel.leftAnchor.constraint(equalTo: productImage.rightAnchor, constant: 10),
            quantityLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            quantityLabel.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 10),
            quantityLabel.widthAnchor.constraint(equalToConstant: 30),
            quantityLabel.heightAnchor.constraint(equalToConstant: 30),
            stepper.centerYAnchor.constraint(equalTo: quantityLabel.centerYAnchor),
            stepper.leftAnchor.constraint(equalTo: quantityLabel.rightAnchor, constant: 10),
            stepper.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            
            
        ])
    }
}
