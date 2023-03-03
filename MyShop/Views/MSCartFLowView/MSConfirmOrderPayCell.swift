//
//  MSConfirmOrderPayCell.swift
//  MyShop
//
//  Created by Sergey on 02.03.2023.
//

import UIKit
import PassKit

final class MSConfirmOrderPayCell: UITableViewCell {
    static let identifier = "confirmOrderPayCell"
    
    private let payView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "main")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let cardInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .label
        label.text = "This card will be used for payment"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let cardNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let expireLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let paymentSystemLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var addCardButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(systemName: "plus.circle")?.withRenderingMode(.alwaysTemplate)
        button.setBackgroundImage(image, for: .normal)
        button.tintColor = UIColor(named: "button")
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var payButton = PKPaymentButton.init(paymentButtonType: .buy, paymentButtonStyle: .automatic)

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        payButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .systemBackground
        contentView.addSubviews(payView)
        payView.applyLayer()
        addCardButton.applyLayer()
        payButton.applyLayer()
        payView.addSubviews(cardInfoLabel, cardNumberLabel, expireLabel, paymentSystemLabel, addCardButton, payButton)
        setupLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
    
    @objc func addButtonPressed(_ sender: UIButton) {
        sender.alpha = 0.4
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.alpha = 1
        }
    }
    
    func configure(with customerBankData: SavedBank) {
        let number = String(customerBankData.cardNumber.suffix(4))
        cardNumberLabel.text = "*********" + number
        expireLabel.text = customerBankData.cardExpire
        paymentSystemLabel.text = customerBankData.cardType.uppercased()
        
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            payView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            payView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            payView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            payView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            
            cardInfoLabel.topAnchor.constraint(equalTo: payView.topAnchor, constant: 15),
            cardInfoLabel.leftAnchor.constraint(equalTo: payView.leftAnchor, constant: 15),
            cardNumberLabel.leftAnchor.constraint(equalTo: payView.leftAnchor, constant: 15),
            cardNumberLabel.topAnchor.constraint(equalTo: cardInfoLabel.bottomAnchor, constant: 7),
            expireLabel.centerYAnchor.constraint(equalTo: cardNumberLabel.centerYAnchor),
            expireLabel.leftAnchor.constraint(equalTo: cardNumberLabel.rightAnchor, constant: 15),
            paymentSystemLabel.leftAnchor.constraint(equalTo: payView.leftAnchor, constant: 15),
            paymentSystemLabel.topAnchor.constraint(equalTo: cardNumberLabel.bottomAnchor, constant: 7),
            addCardButton.topAnchor.constraint(equalTo: payView.topAnchor, constant: 15),
            addCardButton.rightAnchor.constraint(equalTo: payView.rightAnchor, constant: -40),
            addCardButton.widthAnchor.constraint(equalToConstant: 30),
            addCardButton.heightAnchor.constraint(equalToConstant: 30),
            payButton.topAnchor.constraint(equalTo: paymentSystemLabel.bottomAnchor, constant: 20),
            payButton.widthAnchor.constraint(equalToConstant: 240),
            payButton.heightAnchor.constraint(equalToConstant: 50),
            payButton.centerXAnchor.constraint(equalTo: payView.centerXAnchor)
        ])
}
}
