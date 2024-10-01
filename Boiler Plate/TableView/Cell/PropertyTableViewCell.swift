//
//  PropertyTableViewCell.swift
//  Boiler Plate
//
//  Created by Akito Daiki on 01/10/2024.
//

import UIKit

class PropertyTableViewCell: UITableViewCell {
    
    // Create a label to display the property name
    let propertyNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Setup the UI for the cell
    private func setupUI() {
        addSubview(propertyNameLabel)
        // Setup constraints for the label
        NSLayoutConstraint.activate([
            propertyNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            propertyNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            propertyNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
}
