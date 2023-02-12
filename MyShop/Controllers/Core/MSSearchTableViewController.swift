//
//  MSSearchTableViewController.swift
//  MyShop
//
//  Created by Sergey on 12.02.2023.
//

import UIKit

final class MSSearchTableViewController: UITableViewController {
    
    private let searchController = UISearchController(searchResultsController: nil)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        setupTableViewBackgroundView()
        setupSearchBar()
    }
    
    private func setupTableViewBackgroundView() {
        let backgroundViewLabel = UILabel(frame: .zero)
        backgroundViewLabel.textColor = .secondaryLabel
        backgroundViewLabel.numberOfLines = 0
        backgroundViewLabel.text = " Oops, no results to show"
        backgroundViewLabel.textAlignment = NSTextAlignment.center
        backgroundViewLabel.font.withSize(20)
        tableView.backgroundView = backgroundViewLabel
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func setupSearchBar() {
          searchController.searchBar.delegate = self
          searchController.hidesNavigationBarDuringPresentation = false
          searchController.searchBar.placeholder = "What are you looking for?"
          definesPresentationContext = true
          tableView.tableHeaderView = searchController.searchBar
      }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 6
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemBackground
        return cell
    }

 
}

extension MSSearchTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = "nil"
        }
}
