//
//  MSCartView.swift
//  MyShop
//
//  Created by Sergey on 17.02.2023.
//

import UIKit

final class MSCartView: UIView {
    
    let viewModel = MSCartViewModel()
    
    private lazy var cartTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(MSCartTableViewCell.self, forCellReuseIdentifier: MSCartTableViewCell.identifier)
        table.backgroundColor = .systemBackground
        
        
        return table
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(cartTableView)
        addConstraints()
        tableMethods()
    }
    
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
    
    private func tableMethods() {
        //let viewModel = MSCartViewModel()
        cartTableView.dataSource = viewModel
        cartTableView.delegate = viewModel
    }
    
        private func addConstraints() {
            NSLayoutConstraint.activate([
                cartTableView.topAnchor.constraint(equalTo: topAnchor),
                cartTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
                cartTableView.rightAnchor.constraint(equalTo: rightAnchor),
                cartTableView.leftAnchor.constraint(equalTo: leftAnchor)
                
            ])
        }
}
