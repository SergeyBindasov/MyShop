//
//  MSPersonalInfoCell.swift
//  MyShop
//
//  Created by Sergey on 20.02.2023.
//

import UIKit

final class MSPersonalInfoCell: UITableViewCell {
    
    static let identifier = "infoCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemMint
        
    }
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
    
}
