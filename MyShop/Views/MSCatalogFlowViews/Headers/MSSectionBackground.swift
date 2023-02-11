//
//  SectionBackground.swift
//  MyShop
//
//  Created by Sergey on 11.02.2023.
//

import UIKit

class SectionBackgroundDecorationView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .secondarySystemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
}
