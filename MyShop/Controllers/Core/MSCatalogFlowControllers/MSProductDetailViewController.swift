//
//  MSProductDetailViewController.swift
//  MyShop
//
//  Created by Sergey on 09.02.2023.
//

import UIKit
import RealmSwift

protocol MSProductDetailViewControllerDelegate: AnyObject {
    func newProductAddedToCart()
}

final class MSProductDetailViewController: UIViewController {
    
    public weak var delegate: MSProductDetailViewControllerDelegate?
    
    private let product: MSProduct

    var savedProducts: Results<MSSavedProduct>?
    
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
        //print(Realm.Configuration.defaultConfiguration.fileURL)
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
     
    }

    
    func didTaptoAddtoCartButton(_ msProductDetailsView: MSProductDetailsView, didSelectProduct product: MSProduct) {
        let selectedProduct = product.id
        let products = MSRealmManager.shared.loadSavedProducts().self.filter("id == %@",selectedProduct)
        if let thisProduct = products.first {
            try! MSRealmManager.shared.realm.write({
                thisProduct.quantity += 1
            })
        } else {
            let newSavedProduct = MSSavedProduct()
                        newSavedProduct.id = product.id
                        newSavedProduct.quantity = 1
            newSavedProduct.title = product.title
            newSavedProduct.url = product.thumbnail
            newSavedProduct.price = product.price
                        MSRealmManager.shared.saveProduct(product: newSavedProduct)
        }
        
        delegate?.newProductAddedToCart()
}
}

