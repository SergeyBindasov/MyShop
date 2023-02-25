//
//  MSLikedProductCell.swift
//  MyShop
//
//  Created by Sergey on 25.02.2023.
//

import UIKit

final class MSLikedProductCell: UICollectionViewCell {
    
    static let identifier = "likedProductCell"
    
    private let imageView: UIImageView = {
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
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubviews(imageView, nameLabel)
        setupLayout()
        
    }

    
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
    
    func configure(with product: MSLikedProduct) {
        let viewModel = MSImageForCellViewModel(productImageUrlString: product.url)
        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
               DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.imageView.image = image
            }
            case .failure(let error):
                print(String(describing: error))
                break
            }
        }
            nameLabel.text = product.title
        
    }
 
    private func setupLayout() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            imageView.widthAnchor.constraint(equalToConstant: 90),
            imageView.heightAnchor.constraint(equalToConstant: 90),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            ])
    }
}
