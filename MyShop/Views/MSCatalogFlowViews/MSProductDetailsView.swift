//
//  MSProductDetailsView.swift
//  MyShop
//
//  Created by Sergey on 09.02.2023.
//

import UIKit
import RealmSwift

protocol MSProductDetailsViewDelegate: AnyObject {
    func didTaptoAddtoCartButton(_ msProductDetailsView: MSProductDetailsView, didSelectProduct product: MSProduct)
    func didTaptoAddtoLikeButton(_ msProductDetailsView: MSProductDetailsView, didSelectProduct product: MSProduct)
}

final class MSProductDetailsView: UIView {
    
    let realm = try! Realm()
    
    public weak var delegate: MSProductDetailsViewDelegate?
    
    public var collectionView: UICollectionView?
    
    private let product: MSProduct
    
    private var viewModel: MSProductDetailsViewModel? = nil
    
    var isLiked = false
    
    private lazy var addToCartButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add to cart", for: .normal)
        button.setTitleColor(UIColor.systemBackground, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.backgroundColor = .systemTeal
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(addToCartButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var faveButton: UIButton = {
        let like = UIButton()
        like.translatesAutoresizingMaskIntoConstraints = false
        like.setImage(UIImage(systemName: "suit.heart"), for: .normal)
        like.backgroundColor = .secondarySystemBackground
        like.tintColor = .systemRed
        like.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 25), forImageIn: .normal)
        like.layer.cornerRadius = 10
        like.layer.masksToBounds = true
        like.addTarget(self, action: #selector(likeButtonPressed), for: .touchUpInside)
        return like
    }()
    
    init(frame: CGRect, product: MSProduct) {
        self.product = product
        super.init(frame: frame)
        backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
        viewModel = MSProductDetailsViewModel(product: product)
        let collectionView = createCollectionView()
        self.collectionView = collectionView
        setUpCollectionView()
        addSubviews(collectionView, addToCartButton, faveButton)
        addConstraints()
        customLikeButtonState(faveButton)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("unsupported")
    }
    
    @objc func addToCartButtonPressed(_ sender: UIButton) {
        sender.alpha = 0.4
               DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                   sender.alpha = 1
                   self.delegate?.didTaptoAddtoCartButton(self, didSelectProduct: self.product)
               }
    }
    
    @objc func likeButtonPressed(_ sender: UIButton) {
        customLikeButtonState(sender)
                if isLiked {
                    sender.setImage(UIImage(systemName: "suit.heart"), for: .normal)
                } else {
                    sender.setImage(UIImage(systemName: "suit.heart.fill"), for: .normal)
                }
        isLiked = !isLiked
        delegate?.didTaptoAddtoLikeButton(self, didSelectProduct: product)
    }
    
    func customLikeButtonState(_ sender: UIButton) {
        let selectedProduct = product.id
        let likedproducts = realm.objects(MSLikedProduct.self).filter("id == %@",selectedProduct)
        if let thatProduct = likedproducts.first {
            if thatProduct.isLiked == true {
                sender.setImage(UIImage(systemName: "suit.heart.fill"), for: .normal)
                isLiked = true
            } else {
                sender.setImage(UIImage(systemName: "suit.heart"), for: .normal)
                isLiked = false
            }
        }
    }

    private func addConstraints() {
        guard let collectionView = collectionView else { return }
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            addToCartButton.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: -15),
            addToCartButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            addToCartButton.leftAnchor.constraint(equalTo: faveButton.rightAnchor, constant: 15),
            addToCartButton.heightAnchor.constraint(equalToConstant: 50),
            
            faveButton.heightAnchor.constraint(equalToConstant: 50),
            faveButton.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: -15),
            faveButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            faveButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func createCollectionView() -> UICollectionView {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            return self.createSection(for: sectionIndex)
        }
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MSProductGalleryCollectionViewCell.self, forCellWithReuseIdentifier: MSProductGalleryCollectionViewCell.identifier)
        collectionView.register(MSProductInfoCollectionViewCell.self, forCellWithReuseIdentifier: MSProductInfoCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        layout.register(SectionBackgroundDecorationView.self, forDecorationViewOfKind: "background")
        return collectionView
    }
    
    private func createSection(for sectionIndex: Int) -> NSCollectionLayoutSection {
        guard let viewModel = viewModel else { fatalError("unsupported")}
        
        let sectionType = viewModel.sections
        switch sectionType[sectionIndex] {
        case .productGallery:
            return viewModel.createGallerySectionLayout()
        case .productInfo:
            return viewModel.createInfoSectionLayout()
        }
        
    }
    
    private func setUpCollectionView() {
        guard let viewModel = viewModel else { fatalError("unsupported")}
        collectionView?.alpha = 0
        collectionView?.isHidden = true
        collectionView?.delegate = viewModel
        collectionView?.dataSource = viewModel
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            UIView.animate(withDuration: 0.4) {
                self.collectionView?.isHidden = false
                self.collectionView?.alpha = 1
            }
        }
    }
}
