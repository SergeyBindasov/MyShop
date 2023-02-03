//
//  MSCategoriesCollectionViewCell.swift
//  MyShop
//
//  Created by Sergey on 02.02.2023.
//

import UIKit

final class MSCategoriesCollectionViewCell: UICollectionViewCell {
    static let identifier = "MSCategoriesCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.textColor = .label
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubviews(imageView, categoryLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        categoryLabel.text = nil
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -10),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            
            categoryLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            categoryLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            categoryLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            categoryLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5)
        ])
    }
    
    public func configure(with category: String, categoryPic: UIImage) {
        let newCategory = category.replacingOccurrences(of: "-", with: " ", options: .literal, range: nil)
        DispatchQueue.main.async {
            self.categoryLabel.text = newCategory.capitalized
            self.imageView.image = categoryPic
        }
    }
    
}
