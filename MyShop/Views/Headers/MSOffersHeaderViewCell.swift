//
//  MSCatalogCollectionReusableView.swift
//  MyShop
//
//  Created by Sergey on 06.02.2023.
//

import UIKit

final class MSOffersHeaderViewCell: UICollectionViewCell {
    static let identifier = "MSCatalogCollectionReusableView"
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.text = "Special offers"
        label.textColor = .label
        return label
    }()
    
    public func configure() {
        addSubview(headerLabel)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headerLabel.frame = bounds
    }
}
