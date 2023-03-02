//
//  MSConfirmOrderPayCell.swift
//  MyShop
//
//  Created by Sergey on 02.03.2023.
//

import UIKit

final class MSConfirmOrderPayCell: UITableViewCell {
    static let identifier = "confirmOrderPayCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .orange
    }
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
}
