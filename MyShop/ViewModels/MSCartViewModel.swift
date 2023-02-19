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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MSRealmManager.shared.loadSavedProducts().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MSCartTableViewCell.identifier, for: indexPath) as? MSCartTableViewCell else { fatalError() }
        cell.backgroundColor = .systemBackground
        let product = Array(productsInCart)[indexPath.row]
        cell.configure(with: product)
        return  cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "It's time to complete your order"
    }
    
    
}


