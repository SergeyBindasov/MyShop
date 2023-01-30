//
//  MSCatalogViewController.swift
//  MyShop
//
//  Created by Sergey on 30.01.2023.
//

import UIKit

final class MSCatalogViewController: UIViewController {
    let request = MSRequest()
    var products: [MSGetAllProdactInfo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "All goods"
        view.backgroundColor = .systemBackground
        
        MSService.shared.execute(request,
                                 expecting: MSGetAllProdactInfo.self) { [weak self] result in
            
            switch result {
            case .success(let sucssess):
                let array = sucssess.products
               print(array)
            case .failure(let error):
                print(error)
            }
        
            }
        }
    
}
