//
//  MSConfirmOrderTotalCell.swift
//  MyShop
//
//  Created by Sergey on 02.03.2023.
//

import UIKit

final class MSConfirmOrderTotalCell: UITableViewCell {
    static let identifier = "confirmOrderTotalCell"
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .label
        label.numberOfLines = 1
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let itemsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .label
        label.numberOfLines = 1
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBackground
        contentView.addSubviews(priceLabel, itemsLabel)
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
    
    func configure(products: [MSSavedProduct]) {
        let price = (products.map({$0.price * $0.quantity}).reduce(0, +))
        priceLabel.text = String(price) + " " + "$"
        let count = (products.map({$0.quantity}).reduce(0, +))
        itemsLabel.text = String(count) + " " + "items in your cart"
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            priceLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            itemsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            itemsLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            itemsLabel.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor)
            
        ])
    }
}
