//
//  MSConfirmOrderView.swift
//  MyShop
//
//  Created by Sergey on 02.03.2023.
//

import UIKit

final class MSConfirmOrderView: UIView {
    
    lazy var confirmOrderTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(MSConfirmOrderProductCell.self, forCellReuseIdentifier: MSConfirmOrderProductCell.identifier)
        table.register(MSConfirmOrderTotalCell.self, forCellReuseIdentifier: MSConfirmOrderTotalCell.identifier)
        table.register(MSConfirmOrderDeliveryCell.self, forCellReuseIdentifier: MSConfirmOrderDeliveryCell.identifier)
        table.register(MSConfirmOrderPayCell.self, forCellReuseIdentifier: MSConfirmOrderPayCell.identifier)
        table.backgroundColor = .systemBackground
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(confirmOrderTableView)
        confirmOrderTableView.delegate = self
        confirmOrderTableView.dataSource = self
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            confirmOrderTableView.topAnchor.constraint(equalTo: topAnchor),
            confirmOrderTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            confirmOrderTableView.rightAnchor.constraint(equalTo: rightAnchor),
            confirmOrderTableView.leftAnchor.constraint(equalTo: leftAnchor),
        ])
    }
}

extension MSConfirmOrderView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MSConfirmOrderProductCell.identifier, for: indexPath) as? MSConfirmOrderProductCell else { fatalError() }
            
            
            return  cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MSConfirmOrderTotalCell.identifier, for: indexPath) as? MSConfirmOrderTotalCell else { fatalError() }
            return cell
        } else if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MSConfirmOrderDeliveryCell.identifier, for: indexPath) as? MSConfirmOrderDeliveryCell else { fatalError() }
            return cell
    } else if indexPath.section == 3 {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MSConfirmOrderPayCell.identifier, for: indexPath) as? MSConfirmOrderPayCell else { fatalError() }
        return cell
    } else {
        return UITableViewCell()
    }
        
    }
}




