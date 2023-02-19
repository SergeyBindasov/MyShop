//
//  MSCartViewModel.swift
//  MyShop
//
//  Created by Sergey on 17.02.2023.
//

import UIKit
import RealmSwift

final class MSCartViewModel: NSObject {
    var productsInCart = MSRealmManager.shared.loadSavedProducts()
}

extension MSCartViewModel: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
        return MSRealmManager.shared.loadSavedProducts().count
        } else {
            return 1
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MSCartTableViewCell.identifier, for: indexPath) as? MSCartTableViewCell else { fatalError() }
        cell.backgroundColor = .systemBackground
        let product = Array(productsInCart)[indexPath.row]
        cell.configure(with: product)
        return  cell
        } else  {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MSCartOrderCell.identifier, for: indexPath) as? MSCartOrderCell else { fatalError() }
            cell.backgroundColor = .systemBackground
            cell.configure(products: Array(productsInCart))
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
        return UITableView.automaticDimension
        } else {
            return 120
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
        return "It's time to complete your order"
        } else {
            return "Total"
        }
    }
}


