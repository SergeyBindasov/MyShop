//
//  MSCartView.swift
//  MyShop
//
//  Created by Sergey on 17.02.2023.
//

import UIKit

final class MSCartView: UIView {
    
    let viewModel = MSCartViewModel()
    
     lazy var cartTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(MSCartTableViewCell.self, forCellReuseIdentifier: MSCartTableViewCell.identifier)
        table.backgroundColor = .systemBackground
        return table
    }()
    
    private lazy var completeOrederButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Complete", for: .normal)
        button.setTitleColor(UIColor.systemBackground, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.backgroundColor = .systemTeal
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(completeOrderButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(cartTableView, completeOrederButton)
        addConstraints()
        tableMethods()
    }
    
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
    
    @objc func completeOrderButtonPressed(_ sender: UIButton) {
        sender.alpha = 0.4
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.alpha = 1
        }
    }
    private func tableMethods() {
        cartTableView.dataSource = viewModel
        cartTableView.delegate = viewModel
    }
    
        private func addConstraints() {
            NSLayoutConstraint.activate([
                cartTableView.topAnchor.constraint(equalTo: topAnchor),
                cartTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
                cartTableView.rightAnchor.constraint(equalTo: rightAnchor),
                cartTableView.leftAnchor.constraint(equalTo: leftAnchor),
                
                completeOrederButton.bottomAnchor.constraint(equalTo: cartTableView.bottomAnchor, constant: -15),
                completeOrederButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
                completeOrederButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
                completeOrederButton.heightAnchor.constraint(equalToConstant: 50),
                
                
            ])
        }
}


