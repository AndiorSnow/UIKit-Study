//
//  SearchCell.swift
//  UIKit Study
//
//  Created by LMC60018 on 2024/1/26.
//

import UIKit

class SearchCell: UITableViewCell {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpSearchBar()
    }
    
    func setUpSearchBar() {
        contentView.backgroundColor = .blue
        

        self.searchBar.placeholder = "Search"
        self.searchBar.searchBarStyle = .default
        self.searchBar.barStyle = .black
        self.searchBar.barTintColor = .gray
        self.searchBar.enablesReturnKeyAutomatically = true
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
