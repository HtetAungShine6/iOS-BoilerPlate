//
//  HomeView.swift
//  Boiler Plate
//
//  Created by Akito Daiki on 01/10/2024.
//

import UIKit

class HomeView: UIView {
    
    // Create a table view property
    let tableView = UITableView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupTableView()
    }

    // Setup the table view
    private func setupTableView() {
        // Add the table view to the view hierarchy
        addSubview(tableView)
        
        // Set constraints or frame for the table view
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
