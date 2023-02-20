//
//  MSCartViewController.swift
//  MyShop
//
//  Created by Sergey on 30.01.2023.
//

import UIKit

final class MSCartViewController: UIViewController {
    
    let cartView = MSCartView()
    weak var detailsVC: MSProductDetailViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(cartView)
        cartView.viewModel.delegate = self
        setupLayout()
        title = "My cart"
        view.backgroundColor = .systemBackground
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cartView.cartTableView.reloadData()
    }
        
    private func setupLayout() {
        NSLayoutConstraint.activate([
            cartView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cartView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            cartView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            cartView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension MSCartViewController: MSCartViewModelDelegate {
    func orderButtonDidPress() {
        navigationController?.pushViewController(MSConfirmOrderViewController(), animated: true)
    }
    
    
}








