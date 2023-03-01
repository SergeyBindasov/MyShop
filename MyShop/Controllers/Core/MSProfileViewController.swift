//
//  MSProfileViewController.swift
//  MyShop
//
//  Created by Sergey on 30.01.2023.
//

import UIKit

final class MSProfileViewController: UIViewController {
    
    let viewModel = MSProfileViewViewModel()
    
    let profileView = MSProfileView(frame: .zero, customer: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .systemBackground
        viewModel.delegate = self
        addView()
    }
 
    func addView() {

        view.addSubviews(profileView)
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            profileView.rightAnchor.constraint(equalTo: view.rightAnchor),
            profileView.leftAnchor.constraint(equalTo: view.leftAnchor),
        ])
    }
}

extension MSProfileViewController: MSProfileViewViewModelDelegate {
   
    // Я не понимаю почему метод делегата на срабатывает
    func didTapOnLikedProductAtIndex(product: MSProduct, viewModel: MSProfileViewViewModel) {
        let detailsVC = MSProductDetailViewController(product: product)
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
    func didLoadCustomerInfo() {
        profileView.profileTableView.reloadData()
    }
}


