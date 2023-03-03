//
//  MSProfileViewViewModel.swift
//  MyShop
//
//  Created by Sergey on 20.02.2023.
//

import UIKit
import RealmSwift

protocol MSProfileViewViewModelDelegate: AnyObject {
    func didLoadCustomerInfo()
    func didTapOnLikedProductAtIndex(product: MSProduct, viewModel: MSProfileViewViewModel)
}

typealias ProductClosure = ((_ likedProduct: MSProduct) -> Void)

final class MSProfileViewViewModel: NSObject {
    
    let realm = try! Realm()
    var products: Results<MSLikedProduct>?
    
    var customer: MSCustomer?
    var product: MSProduct?
    
    var likedClosure: ProductClosure?
    
    public weak var delegate: MSProfileViewViewModelDelegate?
    
    public func fetchCustomerInfo(id: Int) {
        MSService.shared.execute(MSRequest(urlPath: MSRequest.URLS.customerUrl + String(id)), expecting: MSCustomer.self) { [weak self] result in
            switch result {
            case .success(let response):
                self?.customer = response
                DispatchQueue.main.async {
                    let newCustomer = MSSavedCustomer()
                    let savedAdress = SavedAddress()
                    let savedBank = SavedBank()
                    newCustomer.id = response.id
                    newCustomer.firstName = response.firstName
                    newCustomer.lastName = response.lastName
                    newCustomer.email = response.email
                    newCustomer.phone = response.phone
                    savedAdress.address = response.address.address
                    savedAdress.city = response.address.city
                    savedAdress.postalCode = response.address.postalCode
                    savedAdress.state = response.address.state
                    savedBank.cardType = response.bank.cardType
                    savedBank.cardExpire = response.bank.cardExpire
                    savedBank.cardNumber = response.bank.cardNumber
                    newCustomer.address.append(savedAdress)
                    newCustomer.bank.append(savedBank)
                    do {
                        try self?.realm.write({
                            self?.realm.add(newCustomer)
                        })
                        
                    } catch {
                        print ("error saving context \(error)")
                    }
                    self?.delegate?.didLoadCustomerInfo()
                    
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    public func getProductFromCell(index: Int) {
        if let productId = products?[index].id {
            
            MSService.shared.execute(MSRequest(urlPath: MSRequest.URLS.productUrl + "/" + String(productId)), expecting: MSProduct.self) { [weak self] result in
                switch result {
                case .success(let response):
                    print(response)
                    self?.product = response
                    DispatchQueue.main.async {
                       self?.delegate?.didTapOnLikedProductAtIndex(product: (self?.product!)!, viewModel: self!)
                    }
                case .failure(let error):
                    print(String(describing: error))
                }
            }
        }
    }

    override init() {
        super.init()
        products = realm.objects(MSLikedProduct.self)
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
            cell.backgroundColor = .systemBackground
            cell.selectionStyle = .none
            return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MSAdressCell.identifier, for: indexPath) as? MSAdressCell else { fatalError() }
            cell.configure(with: customer)
            cell.backgroundColor = .systemBackground
            return cell
        } else if indexPath.section == 2 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MSBankCardCell.identifier, for: indexPath) as? MSBankCardCell else { fatalError() }
            cell.configure(with: customer)
            cell.backgroundColor = .systemBackground
            return cell
        } else if indexPath.section == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MSWishlistCell.identifier, for: indexPath) as? MSWishlistCell else { fatalError() }
            cell.didSelectClosure = {
                tableIndex, collectionIndex  in
                if let collectionIndex = collectionIndex {
                    self.getProductFromCell(index: collectionIndex)
                }
            }
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

