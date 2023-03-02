//
//  MSConfirmOrderTotalCell.swift
//  MyShop
//
//  Created by Sergey on 02.03.2023.
//

import UIKit

final class MSConfirmOrderTotalCell: UITableViewCell {
    static let identifier = "confirmOrderTotalCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemTeal
    }
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
}
