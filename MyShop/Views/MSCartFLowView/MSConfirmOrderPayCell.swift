//
//  MSConfirmOrderPayCell.swift
//  MyShop
//
//  Created by Sergey on 02.03.2023.
//

import UIKit

final class MSConfirmOrderPayCell: UITableViewCell {
    static let identifier = "confirmOrderPayCell"
    
    private let cardInfoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .label
        label.text = "This card will be used for payment"
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBackground
        contentView.addSubviews(cardInfoLabel)
    }
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
}
