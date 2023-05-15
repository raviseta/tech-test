//
//  TableViewSectionSearchBarHeaderView.swift
//  CarouselSample
//
//  Created by Ravi Seta on 15/05/23.
//

import UIKit

class TableViewSectionSearchBarHeaderView: UITableViewHeaderFooterView {

    // MARK: - @IBOutlets
    
    @IBOutlet weak private var searchBar: UISearchBar!
    
    // MARK: - Properties
    
    var didSearch: ((_ searchText: String?) -> Void)?
    
    // MARK: - AwakeFromNib
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    // MARK: - Setup

    private
    func setupUI() {
        self.searchBar.placeholder = "Search"
        self.searchBar.showsCancelButton = true
        self.searchBar.delegate = self
    }
    
    func resetSearch() {
        self.searchBar.text = ""
        self.searchBar.resignFirstResponder()
        self.endEditing(true)
        
        didSearch?(self.searchBar.text)
    }
}

// MARK: - SearchBarDelegates

extension TableViewSectionSearchBarHeaderView: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.resetSearch()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        didSearch?(searchBar.text)
    }
}
