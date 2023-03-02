//
//  MSConfirmOrderDeliveryCell.swift
//  MyShop
//
//  Created by Sergey on 02.03.2023.
//

import UIKit

final class MSConfirmOrderDeliveryCell: UITableViewCell {
    static let identifier = "confirmOrderDeliveryCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .green
    }
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
}
