//
//  MSProductDetailViewController.swift
//  MyShop
//
//  Created by Sergey on 09.02.2023.
//

import UIKit

final class MSProductDetailViewController: UIViewController {
    
    private let product: MSProduct
   // private let detailsView = MSProductDetailsView()
    
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
        //view.addSubviews(detailsView)
        setupView()
        print(product.images)
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

//extension MSProductDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//    
//    
//}

