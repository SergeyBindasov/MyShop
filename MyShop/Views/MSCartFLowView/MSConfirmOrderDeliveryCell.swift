//
//  MSConfirmOrderDeliveryCell.swift
//  MyShop
//
//  Created by Sergey on 02.03.2023.
//

import UIKit

final class MSConfirmOrderDeliveryCell: UITableViewCell {
    static let identifier = "confirmOrderDeliveryCell"
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let postalLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let contactInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "Contacts for delivery service"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    private let secondNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let phoneLabel: UILabel = {
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
        contentView.addSubviews(cityLabel, postalLabel, stateLabel, addressLabel, contactInfoLabel, nameLabel, secondNameLabel, phoneLabel)
        setupLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
    
    func configure(with customer: MSCustomer) {
        cityLabel.text = "City: \(customer.address.city)"
        stateLabel.text = "State: \(customer.address.state)"
        postalLabel.text = "Postal code: \(customer.address.postalCode)"
        addressLabel.text = "Address: \(customer.address.address)"
        nameLabel.text = customer.firstName
        secondNameLabel.text = customer.lastName
        phoneLabel.text = customer.phone
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            cityLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            stateLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 7),
            stateLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            postalLabel.topAnchor.constraint(equalTo: stateLabel.bottomAnchor, constant: 7),
            postalLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            addressLabel.topAnchor.constraint(equalTo: postalLabel.bottomAnchor, constant: 7),
            addressLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            addressLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            contactInfoLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            contactInfoLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 20),
            nameLabel.topAnchor.constraint(equalTo: contactInfoLabel.bottomAnchor, constant: 7),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            secondNameLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            secondNameLabel.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 5),
            phoneLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 7),
            phoneLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
        ])
}
}