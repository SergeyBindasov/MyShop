//
//  MSCartViewModel.swift
//  MyShop
//
//  Created by Sergey on 17.02.2023.
//

import UIKit
import RealmSwift
import SwipeCellKit

protocol MSCartViewModelDelegate: AnyObject {
    func orderButtonDidPress()
}

final class MSCartViewModel: NSObject {
    
    weak var delegate: MSCartViewModelDelegate?

    var productsInCart = MSRealmManager.shared.loadSavedProducts()
    let realm = try! Realm()
    var products: Results<MSSavedProduct>?
    var tableView: UITableView?
    
    override init() {
        super.init()
        loadProducts()
    }
    
    func loadProducts() {
        products = realm.objects(MSSavedProduct.self)
        tableView?.reloadData()
    }    
}

extension MSCartViewModel: MSCartOrderCellDelegate {
    func completeButtonDidPress() {
        delegate?.orderButtonDidPress()
    }
}

extension MSCartViewModel: UITableViewDelegate, UITableViewDataSource, SwipeTableViewCellDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return products?.count ?? 1
        } else {
            return 1
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MSCartTableViewCell.identifier, for: indexPath) as? MSCartTableViewCell else { fatalError() }
            cell.backgroundColor = .systemBackground
            let product = Array(productsInCart)[indexPath.row]
            cell.delegate = self
            cell.configure(with: product)
            return  cell
        } else  {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MSCartOrderCell.identifier, for: indexPath) as? MSCartOrderCell else { fatalError() }
            cell.backgroundColor = .systemBackground
            cell.configure(products: Array(productsInCart))
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { [weak self] action, indexPath in
            if let productToDelete = self?.products?[indexPath.row] {
                do {
                    try self?.realm.write {
                        self?.realm.delete(productToDelete)
                        
                    }
                } catch {
                    print("Error deleting item \(error)")
                }
                tableView.numberOfRows(inSection: indexPath.section)
                DispatchQueue.main.async {
                    tableView.reloadData()
                }
            }
        }
        deleteAction.image = UIImage(systemName: "trash")
        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        return options
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
