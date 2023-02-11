//
//  MSProductDetailViewController.swift
//  MyShop
//
//  Created by Sergey on 09.02.2023.
//

import UIKit

final class MSProductDetailViewController: UIViewController {
    
    private let product: MSProduct
    
    init (product: MSProduct) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = product.title
        setupView()
    }
    
    private func setupView() {
        let detailsView = MSProductDetailsView(frame: .zero, product: product)
        view.addSubviews(detailsView)
        
        NSLayoutConstraint.activate([
                detailsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                detailsView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
                detailsView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
                detailsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
}

