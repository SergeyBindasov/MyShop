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
        navigationItem.rightBarButtonItem = UIBarButtonItem(
                  barButtonSystemItem: .action,
                  target: self,
                  action: #selector(didTapShare))
    }
    
    @objc private func didTapShare() {
            // Share
        print("Поделиться \(product.id)")
        }
    
    private func setupView() {
        let detailsView = MSProductDetailsView(frame: .zero, product: product)
        detailsView.delegate = self
        view.addSubviews(detailsView)
        
        NSLayoutConstraint.activate([
                detailsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                detailsView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
                detailsView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
                detailsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
}

extension MSProductDetailViewController: MSProductDetailsViewDelegate {
    func didTaptoAddtoLikeButton(_ msProductDetailsView: MSProductDetailsView, didSelectProduct product: MSProduct) {
        //Сохранение продукта в БД для отображения в списке избранного
        print("\(product.id) в избранном")
    }
    
    func didTaptoAddtoCartButton(_ msProductDetailsView: MSProductDetailsView, didSelectProduct product: MSProduct) {
        //Сохранение продукта в БД для отображения в корзине 
        print("\(product.id) в корзине")
    }
    
    
}

