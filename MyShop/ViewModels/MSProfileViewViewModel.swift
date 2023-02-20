//
//  MSProfileViewViewModel.swift
//  MyShop
//
//  Created by Sergey on 20.02.2023.
//

import UIKit

final class MSProfileViewViewModel: NSObject {
    
}

extension MSProfileViewViewModel: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
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
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MSPersonalInfoCell.identifier, for: indexPath) as? MSPersonalInfoCell else { fatalError() }
        
        return cell
        } else if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MSAdressCell.identifier, for: indexPath) as? MSAdressCell else { fatalError() }
        return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MSBankCardCell.identifier, for: indexPath) as? MSBankCardCell else { fatalError() }
        return cell
        }
}
}
