//
//  MSCategoryViewController.swift
//  MyShop
//
//  Created by Sergey on 03.02.2023.
//

import UIKit

final class MSCategoryViewController: UIViewController {
    
    private let category: String
    private let viewModel = MSCategoryViewViewModel()
    
    var categoryCallBack: ((String) -> Void)?
    
    init(category: String
    ) {
        self.category = category
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupView()
        title = category.replacingOccurrences(of: "-", with: " ", options: .literal, range: nil).capitalized
    }
    
    private func setupView() {
        let categoryView = MSCategoryView(frame: .zero, category: category)
        categoryView.delegate = self
        view.addSubview(categoryView)
        NSLayoutConstraint.activate([
            categoryView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            categoryView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            categoryView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            categoryView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension MSCategoryViewController: MSCategoryViewDelegate {
    func showSelectedProduct(_ msCategoreView: MSCategoryView, didSelectProduct product: MSProduct) {
        print("Selected \(product.title)")
    }
    
    
}
