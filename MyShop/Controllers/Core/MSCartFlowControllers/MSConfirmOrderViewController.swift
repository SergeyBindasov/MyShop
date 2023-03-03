//
//  MSConfirmOrderViewController.swift
//  MyShop
//
//  Created by Sergey on 20.02.2023.
//

import UIKit

final class MSConfirmOrderViewController: UIViewController {
    
    let confirmOrderView = MSConfirmOrderView()
    
    weak var profileVC: MSProfileViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Confirm Your Order"
        view.backgroundColor = .systemBackground
        view.addSubviews(confirmOrderView)
        setupLayout()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            confirmOrderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            confirmOrderView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            confirmOrderView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            confirmOrderView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

