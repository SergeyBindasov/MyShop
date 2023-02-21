//
//  MSAdressCell.swift
//  MyShop
//
//  Created by Sergey on 20.02.2023.
//

import UIKit

final class MSAdressCell: UITableViewCell {
    
    static let identifier = "adressCell"
    
    private let introLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .secondaryLabel
        label.text = "We will send your orders here"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .label
        label.text = "City: Moscow"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .label
        label.text = "State: DC"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let postalLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .label
        label.text = "Postal code: 46007"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let adressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .label
        label.text = "Adress: 2811 Battery Place Northwest"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        contentView.addSubviews(introLabel, cityLabel, stateLabel, postalLabel, adressLabel)
        setupLayout()
        
    }
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            introLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            introLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            cityLabel.topAnchor.constraint(equalTo: introLabel.bottomAnchor, constant: 15),
            cityLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            stateLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 7),
            stateLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            postalLabel.topAnchor.constraint(equalTo: stateLabel.bottomAnchor, constant: 7),
            postalLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            adressLabel.topAnchor.constraint(equalTo: postalLabel.bottomAnchor, constant: 7),
            adressLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            adressLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            adressLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            
        ])
    }
}
