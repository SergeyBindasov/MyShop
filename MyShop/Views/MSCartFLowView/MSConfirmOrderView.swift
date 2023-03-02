//
//  MSConfirmOrderView.swift
//  MyShop
//
//  Created by Sergey on 02.03.2023.
//

import UIKit
import RealmSwift

final class MSConfirmOrderView: UIView {
    
    let realm = try! Realm()
    var products: Results<MSSavedProduct>?
    
    lazy var confirmOrderTableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(MSConfirmOrderProductCell.self, forCellReuseIdentifier: MSConfirmOrderProductCell.identifier)
        table.register(MSConfirmOrderTotalCell.self, forCellReuseIdentifier: MSConfirmOrderTotalCell.identifier)
        table.register(MSConfirmOrderDeliveryCell.self, forCellReuseIdentifier: MSConfirmOrderDeliveryCell.identifier)
        table.register(MSConfirmOrderPayCell.self, forCellReuseIdentifier: MSConfirmOrderPayCell.identifier)
        table.backgroundColor = .systemBackground
        table.showsVerticalScrollIndicator = false
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(confirmOrderTableView)
        loadProducts()
        confirmOrderTableView.delegate = self
        confirmOrderTableView.dataSource = self
        addConstraints()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadProducts() {
        products = realm.objects(MSSavedProduct.self)
        confirmOrderTableView.reloadData()
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
        if section == 0 {
            return products?.count ?? 0
        } else if section == 1 {
            return 1
            
        } else {
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 80
        } else if indexPath.section == 1 {
            return 40
        } else {
            return 20
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MSConfirmOrderProductCell.identifier, for: indexPath) as? MSConfirmOrderProductCell else { fatalError() }
            cell.configure(with: (products?[indexPath.row])!)
            return  cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MSConfirmOrderTotalCell.identifier, for: indexPath) as? MSConfirmOrderTotalCell else { fatalError() }
            guard let productsArray = products else {  fatalError() }
            cell.configure(products: Array(productsArray))
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
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Check your order"
        } else if section == 1  {
            return "Total price"
        } else if section == 2  {
            return "Your order will be delivered here"
        } else if section == 3  {
            return "Payment"
        } else {
            return ""
        }
    }
}
