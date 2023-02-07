//
//  MSCategoryViewController.swift
//  MyShop
//
//  Created by Sergey on 03.02.2023.
//

import UIKit

final class MSCategoryViewController: UIViewController {
    
    private let category: String
    private let categoryView = MSCategoryView()
    private let viewModel: MSCategoryViewModel
   
    
    init(category: String, viewModel: MSCategoryViewModel) {
        self.viewModel = viewModel
        self.category = category
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        title = category.replacingOccurrences(of: "-", with: " ", options: .literal, range: nil).capitalized
        viewModel.fetchProducts()

        
    }
    
    private func setupView() {
           
        view.addSubview(categoryView)
           NSLayoutConstraint.activate([
            categoryView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            categoryView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            categoryView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            categoryView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
           ])
           
       }

}
