//
//  MSSearchTableViewController.swift
//  MyShop
//
//  Created by Sergey on 12.02.2023.
//

import UIKit

final class MSSearchTableViewController: UITableViewController {
    
    private let searchController = UISearchController(searchResultsController: nil)
    private let backgroundViewLabel = UILabel(frame: .zero)
    private var previousRun = Date()
    private let minInterval = 0.05
    
    private var searchResults = [MSProduct]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        setupTableView()
        setupTableViewBackgroundView()
        setupSearchBar()
    }
    
    func fetchProducts(search: String) {
        MSService.shared.execute(MSRequest(urlPath: "/search?q="+search), expecting: MSGetAllProdactInfo.self) { [weak self] result in
            switch result {
            case .success(let response):
                self?.searchResults = response.products
                DispatchQueue.main.async {
                    if self?.searchResults.count == 0 {
                        self?.backgroundViewLabel.text = " Oops, no results to show"
                    }
                    self?.tableView.reloadData()
                    
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    private func setupTableView() {
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 80
        tableView.register(MSSearchTableViewCell.self, forCellReuseIdentifier: MSSearchTableViewCell.identifier)
    }
    
    private func setupTableViewBackgroundView() {
        
        backgroundViewLabel.textColor = .secondaryLabel
        backgroundViewLabel.numberOfLines = 0
        backgroundViewLabel.text = "Here will be search results. Or not."
        backgroundViewLabel.textAlignment = NSTextAlignment.center
        backgroundViewLabel.font.withSize(20)
        tableView.backgroundView = backgroundViewLabel
        
    }
    
    private func setupSearchBar() {
        searchController.searchBar.delegate = self
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchBar.placeholder = "What are you looking for?"
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MSSearchTableViewCell.identifier, for: indexPath) as? MSSearchTableViewCell else { fatalError() }
        cell.backgroundColor = .secondarySystemBackground
        cell.configure(with: searchResults[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productDetilVC = MSProductDetailViewController(product: searchResults[indexPath.row])
        navigationController?.pushViewController(productDetilVC, animated: true)
    }
}

extension MSSearchTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchResults.removeAll()
        guard let textToSearch = searchBar.text, !textToSearch.isEmpty else {
            return
        }
        if Date().timeIntervalSince(previousRun) > minInterval {
            previousRun = Date()
            fetchProducts(search: searchText)
            backgroundViewLabel.text = ""
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchResults.removeAll()
    }
}
