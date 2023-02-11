//
//  MSCategoryViewModel.swift
//  MyShop
//
//  Created by Sergey on 07.02.2023.
//

import UIKit

protocol MSCategoryViewViewModelDelegate: AnyObject {
    func didLoadCategoryProducts()
    func didSelectProduct(_ product: MSProduct)
}

final class MSCategoryViewViewModel: NSObject {
    
    public weak var delegate: MSCategoryViewViewModelDelegate?
    
    private var cellViewModel: [MSCategoryCollectionViewCellViewModel] = []
    
    private var products: [MSProduct] = [] {
        didSet {
            for product in products {
                let viewModel = MSCategoryCollectionViewCellViewModel(
                    title: product.title,
                    price: product.price,
                    discountPercentage: product.discountPercentage,
                    brand: product.brand,
                    thumbnail: product.thumbnail)
                cellViewModel.append(viewModel)
            }
        }
    }
    
    public func fetchProducts(category: String) {
        MSService.shared.execute(MSRequest(urlPath: "/category/"+category), expecting: MSGetAllProdactInfo.self) { [weak self] result in
            switch result {
            case .success(let response):
                self?.products = response.products
                DispatchQueue.main.async {
                    self?.delegate?.didLoadCategoryProducts()
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

// MARK: - Collection View
extension MSCategoryViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var offset: CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MSProductsCollectionViewCell.cellIdentifier, for: indexPath) as? MSProductsCollectionViewCell else { fatalError("unsupported cell")}
        cell.configure(with: cellViewModel[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.bounds.width - offset * 4 ) / 2
        let hight: CGFloat = 300
        return CGSize(width: width, height: hight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        delegate?.didSelectProduct(product)
    }
}
