//
//  ViewController.swift
//  MyShop
//
//  Created by Sergey on 30.01.2023.
//

import UIKit

final class MSTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupTabs()
    }
    
    private func setupTabs() {
        let catalogVC = MSCatalogViewController()
        let cartVC = MSCartViewController()
        let profileVC = MSProfileViewController()
        
        catalogVC.navigationItem.largeTitleDisplayMode = .automatic
        cartVC.navigationItem.largeTitleDisplayMode = .automatic
        profileVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let navOne = UINavigationController(rootViewController: catalogVC)
        let navTwo = UINavigationController(rootViewController: cartVC)
        let navThree = UINavigationController(rootViewController: profileVC)
        
        navOne.tabBarItem = UITabBarItem(title: "Catalog",
                                         image: UIImage(systemName: "bag"),
                                         tag: 1)
        navTwo.tabBarItem = UITabBarItem(title: "Cart",
                                         image: UIImage(systemName: "cart"),
                                         tag: 2)
        navThree.tabBarItem = UITabBarItem(title: "Profile",
                                           image: UIImage(systemName: "person"),
                                           tag: 3)
        
        for nav in [navOne, navTwo, navThree] {
                    nav.navigationBar.prefersLargeTitles = true
                }
        setViewControllers([navOne, navTwo, navThree], animated: true)
    }
}

