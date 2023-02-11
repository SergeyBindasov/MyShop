//
//  MSProductGalleryCollectionViewCell.swift
//  MyShop
//
//  Created by Sergey on 11.02.2023.
//

import UIKit

final class MSProductGalleryCollectionViewCell: UICollectionViewCell {
    static let identifier = "galleryCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .redraw
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemBackground
        contentView.addSubviews(imageView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    public func configure(with image: UIImage?) {
        if let image = image {
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }
}
