//
//  MSAdressCell.swift
//  MyShop
//
//  Created by Sergey on 20.02.2023.
//

import UIKit

final class MSAdressCell: UITableViewCell {
    
    static let identifier = "adressCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemPink
        
    }
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
}
