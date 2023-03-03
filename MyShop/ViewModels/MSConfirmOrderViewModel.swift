//
//  MSConfirmOrderViewModel.swift
//  MyShop
//
//  Created by Sergey on 02.03.2023.
//

import UIKit
final class MSConfirmOrderViewModel {
    
    var customer: MSCustomer
    
    init (customer: MSCustomer) {
        self.customer = customer
    }
    
    public func fetchCustomerInfo(id: Int, tableView: UITableView, customer: MSCustomer) {
        MSService.shared.execute(MSRequest(urlPath: MSRequest.URLS.customerUrl + String(id)), expecting: MSCustomer.self) { [weak self] result in
            switch result {
            case .success(let response):
                self?.customer = response
                DispatchQueue.main.async {
                    tableView.reloadData()
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
}
