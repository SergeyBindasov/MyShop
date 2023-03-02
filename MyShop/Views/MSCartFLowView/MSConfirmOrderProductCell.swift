//
//  MSConfirmOrderProductCell.swift
//  MyShop
//
//  Created by Sergey on 02.03.2023.
//

import UIKit

final class MSConfirmOrderProductCell: UITableViewCell {
    static let identifier = "confirmOrderProductCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .purple
    }
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
}
