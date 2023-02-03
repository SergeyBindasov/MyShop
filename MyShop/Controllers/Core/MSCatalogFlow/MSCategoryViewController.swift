//
//  MSCategoryViewController.swift
//  MyShop
//
//  Created by Sergey on 03.02.2023.
//

import UIKit

final class MSCategoryViewController: UIViewController {
    
    private let category: String
    
    init(category: String) {
        self.category = category
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = category.replacingOccurrences(of: "-", with: " ", options: .literal, range: nil).capitalized

        
    }

}
