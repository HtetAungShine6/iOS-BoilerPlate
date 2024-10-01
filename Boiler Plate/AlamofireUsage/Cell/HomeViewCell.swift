//
//  HomeViewCell.swift
//  Boiler Plate
//
//  Created by Akito Daiki on 01/10/2024.
//

import UIKit

class HomeViewCell: UITableViewCell {
    
    private let factLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCell()
    }
    
    // Setup the cell views
    private func setupCell() {
        contentView.addSubview(factLabel)
        
        factLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            factLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            factLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            factLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            factLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
        
        factLabel.numberOfLines = 0
    }
    
    // Configure the cell with cat fact data
    func configure(with catFact: CatFact) {
        factLabel.text = catFact.text
    }
}
