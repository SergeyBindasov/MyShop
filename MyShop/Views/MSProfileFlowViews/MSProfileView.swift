//
//  MSProfileView.swift
//  MyShop
//
//  Created by Sergey on 20.02.2023.
//

import UIKit

final class MSProfileView: UIView {
    
    private let customer: MSCustomer?
    
    let viewModel = MSProfileViewViewModel()
    
    lazy var profileTableView: UITableView = {
       let table = UITableView(frame: .zero, style: .grouped)
       table.translatesAutoresizingMaskIntoConstraints = false
        table.register(MSPersonalInfoCell.self, forCellReuseIdentifier: MSPersonalInfoCell.identifier)
        table.register(MSAdressCell.self, forCellReuseIdentifier: MSAdressCell.identifier)
        table.register(MSBankCardCell.self, forCellReuseIdentifier: MSBankCardCell.identifier)
        table.backgroundColor = .systemBackground
       return table
   }()
    
    init(frame: CGRect, customer: MSCustomer?) {
        self.customer = customer
        super.init(frame: frame)
        backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(profileTableView)
        setupLayout()
        tableViewMethods()
    }
    
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
    
    func tableViewMethods() {
        profileTableView.dataSource = viewModel
        profileTableView.delegate = viewModel
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            profileTableView.topAnchor.constraint(equalTo: topAnchor),
            profileTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            profileTableView.rightAnchor.constraint(equalTo: rightAnchor),
            profileTableView.leftAnchor.constraint(equalTo: leftAnchor),
        ])
    }
}