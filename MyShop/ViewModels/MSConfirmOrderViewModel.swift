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
    
    public func fetchCustomerInfo(id: Int, tableView: UITableView) {
        MSService.shared.execute(MSRequest(urlPath: MSRequest.URLS.customerUrl + String(id)), expecting: MSCustomer.self) { [weak self] result in
            switch result {
            case .success(let response):
                print(response)
                self?.customer = response
                DispatchQueue.main.async {
                    tableView.reloadData()
                    //self?.delegate?.didLoadCustomerInfo()
                    
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
}
