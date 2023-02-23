//
//  MSBankCardCell.swift
//  MyShop
//
//  Created by Sergey on 20.02.2023.
//

import UIKit

final class MSBankCardCell: UITableViewCell {
    
    static let identifier = "bankCardCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemOrange.withAlphaComponent(0.5)
        
    }
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
}
