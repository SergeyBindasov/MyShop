//
//  Extensions.swift
//  MyShop
//
//  Created by Sergey on 02.02.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach ({
            addSubview($0)
        })
    }
}


