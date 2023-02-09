//
//  MSCategoryView.swift
//  MyShop
//
//  Created by Sergey on 06.02.2023.
//

import UIKit

protocol MSCategoryViewDelegate: AnyObject {
    func showSelectedProduct(_ msCategoreView: MSCategoryView, didSelectProduct product: MSProduct)
}

final class MSCategoryView: UIView {
    
    public weak var delegate: MSCategoryViewDelegate?
    
    private let category: String
    
    private let viewModel = MSCategoryViewViewModel()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(MsProductsCollectionViewCell.self, forCellWithReuseIdentifier: MsProductsCollectionViewCell.cellIdentifier)
        collection.isHidden = true
        collection.alpha = 0
        return collection
    }()
    
    init(frame: CGRect, category: String) {
        self.category = category
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        spinner.startAnimating()
        addSubviews(collectionView, spinner)
        setUpCollectionView()
        addConstraints()
        viewModel.delegate = self
        viewModel.fetchProducts(category: category)
    }
    
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setUpCollectionView() {
        collectionView.delegate = viewModel
        collectionView.dataSource = viewModel
    }
}

//MARK: - ViewModel Delegate
extension MSCategoryView: MSCategoryViewViewModelDelegate {
    func didLoadCategoryProducts() {
        spinner.stopAnimating()
        collectionView.isHidden = false
        collectionView.reloadData()
        UIView.animate(withDuration: 0.6) {
            self.collectionView.alpha = 1
        }
    }
    func didSelectProduct(_ product: MSProduct) {
        delegate?.showSelectedProduct(self, didSelectProduct: product)
    }
}
