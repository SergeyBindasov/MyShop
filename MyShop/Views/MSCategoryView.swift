//
//  MSCategoryView.swift
//  MyShop
//
//  Created by Sergey on 06.02.2023.
//

import UIKit

final class MSCategoryView: UICollectionViewCell {
    
    
    
    override init(frame: CGRect) {
           super.init(frame: frame)
           translatesAutoresizingMaskIntoConstraints = false
           backgroundColor = .systemBlue
       }
       
       required init?(coder: NSCoder) {
           fatalError("unsupported")
       }
    
}
