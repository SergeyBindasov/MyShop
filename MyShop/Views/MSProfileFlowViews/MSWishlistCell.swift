//
//  MSWishlistCell.swift
//  MyShop
//
//  Created by Sergey on 22.02.2023.
//

import UIKit

final class MSWishlistCell: UITableViewCell {
    
    static let identifier = "wishlistCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemRed.withAlphaComponent(0.5)
        
    }
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
}
