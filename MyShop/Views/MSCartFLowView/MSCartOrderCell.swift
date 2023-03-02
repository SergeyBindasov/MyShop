//
//  MSCartOrderCell.swift
//  MyShop
//
//  Created by Sergey on 19.02.2023.
//

import UIKit

protocol MSCartOrderCellDelegate: AnyObject {
    func completeButtonDidPress()
}

final class MSCartOrderCell: UITableViewCell {
    static let identifier = "orderCell"
    
    public weak var delegate: MSCartOrderCellDelegate?
    
    private lazy var completeOrederButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Complete", for: .normal)
        button.setTitleColor(UIColor.systemBackground, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.backgroundColor = .systemTeal
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(completeOrderButtonPressed), for: .touchUpInside)
        return button
    }()
    
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
        label.textColor = .secondaryLabel
        label.numberOfLines = 1
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(completeOrederButton, priceLabel, itemsLabel)
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
    
    @objc func completeOrderButtonPressed(_ sender: UIButton) {
        
        sender.alpha = 0.4
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.delegate?.completeButtonDidPress()
            sender.alpha = 1
        }
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            priceLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            completeOrederButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 15),
            completeOrederButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            completeOrederButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            completeOrederButton.heightAnchor.constraint(equalToConstant: 50),
            itemsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            itemsLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            itemsLabel.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor)
            
        ])
    }
}
