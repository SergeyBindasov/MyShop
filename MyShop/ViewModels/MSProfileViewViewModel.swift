//
//  MSProfileViewViewModel.swift
//  MyShop
//
//  Created by Sergey on 20.02.2023.
//

import UIKit

protocol MSProfileViewViewModelDelegate: AnyObject {
    func didLoadCustomerInfo()
}

final class MSProfileViewViewModel: NSObject {
    
    var customer: MSCustomer?
    
    public weak var delegate: MSProfileViewViewModelDelegate?
    
    public func fetchCustomerInfo(id: Int) { //-> MSCustomer {
        MSService.shared.execute(MSRequest(urlPath: MSRequest.URLS.customerUrl + String(id)), expecting: MSCustomer.self) { [weak self] result in
            switch result {
            case .success(let response):
                print(response)
                self?.customer = response
                DispatchQueue.main.async {
                    self?.delegate?.didLoadCustomerInfo()

                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

extension MSProfileViewViewModel: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.section == 0 {
//            return 200
//        } else {
//            return 150
//        }
//    }
        
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Personal information"
        } else if section == 1 {
                return "Delivery adress"
        } else {
            return "Saved bank cards"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let customer = customer else { fatalError()  }
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MSPersonalInfoCell.identifier, for: indexPath) as? MSPersonalInfoCell else { fatalError() }
            cell.configure(with: customer)
        return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MSAdressCell.identifier, for: indexPath) as? MSAdressCell else { fatalError() }
            cell.configure(with: customer)
        return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MSBankCardCell.identifier, for: indexPath) as? MSBankCardCell else { fatalError() }
        return cell
        }
}
} 
