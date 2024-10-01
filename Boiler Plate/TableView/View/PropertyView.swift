//
//  PropertyView.swift
//  Boiler Plate
//
//  Created by Akito Daiki on 01/10/2024.
//

import Foundation
import UIKit

class PropertyView: UIView {
    
    // Create the table view
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "propertyCell")
        return tableView
    }()
    
    // Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // Set up the UI
    private func setupUI() {
        backgroundColor = .white
        addSubview(tableView)
        setupConstraints()
    }
    
    // Set up the constraints for the table view
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

