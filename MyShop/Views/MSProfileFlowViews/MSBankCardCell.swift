//
//  MSBankCardCell.swift
//  MyShop
//
//  Created by Sergey on 20.02.2023.
//

import UIKit
import CreditCardView

final class MSBankCardCell: UITableViewCell {
    
    static let identifier = "bankCardCell"
 
    lazy var cardView = CreditCardView(frame: CGRect(x: 0, y: 0, width: contentView.bounds.width, height: 180), template: .Curve(.systemMint, .systemTeal, .systemMint, .systemTeal, .systemMint))
            
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBackground
        contentView.addSubviews(cardView)
        setupLayout()
        
    }
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
    
    func configure(with customer: MSCustomer) {
        
        cardView.nameLabel.text = customer.firstName + " " + customer.lastName
        cardView.expLabel.text = customer.bank.cardExpire
        cardView.numLabel.text = customer.bank.cardNumber
        cardView.brandLabel.text = customer.bank.cardType
    }
        
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            cardView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
    }
}
