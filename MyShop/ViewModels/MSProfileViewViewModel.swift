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
    
    public func fetchCustomerInfo(id: Int) { 
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
        4
    }
 
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Personal information"
        } else if section == 1 {
                return "Delivery adress"
        } else if section == 2{
            return "Saved bank cards"
        } else {
            return " My wishlist"
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
        } else if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MSBankCardCell.identifier, for: indexPath) as? MSBankCardCell else { fatalError() }
            cell.configure(with: customer)
        return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MSWishlistCell.identifier, for: indexPath) as? MSWishlistCell else { fatalError() }
            return cell
        }
}
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section)
    }
}

