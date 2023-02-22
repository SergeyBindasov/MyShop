//
//  MSPersonalInfoCell.swift
//  MyShop
//
//  Created by Sergey on 20.02.2023.
//

import UIKit

final class MSPersonalInfoCell: UITableViewCell {
    
    static let identifier = "infoCell"
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .label
        //label.text = "Ivan Ivanov"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let mailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let avatarImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.secondaryLabel.cgColor
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemTeal.withAlphaComponent(0.7)
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        contentView.addSubviews(nameLabel, secondNameLabel, mailLabel, phoneLabel, avatarImage)
        setupLayout()
        
    }
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
    
    func configure(with customer: MSCustomer) {
        nameLabel.text = customer.firstName
        secondNameLabel.text = customer.lastName
        mailLabel.text = customer.email
        phoneLabel.text = customer.phone
        let imageViewModel = MSImageForCellViewModel(productImageUrlString: customer.image)
        imageViewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.avatarImage.image = image
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
        }
        
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            secondNameLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            secondNameLabel.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 5),
            mailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 15),
            mailLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            phoneLabel.topAnchor.constraint(equalTo: mailLabel.bottomAnchor, constant: 7),
            phoneLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            avatarImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            avatarImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            avatarImage.widthAnchor.constraint(equalToConstant: 100),
            avatarImage.heightAnchor.constraint(equalToConstant: 100),
            avatarImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
        ])
    }
    
}
