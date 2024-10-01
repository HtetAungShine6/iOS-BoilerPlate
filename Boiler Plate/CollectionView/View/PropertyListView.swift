//
//  PropertyView.swift
//  Boiler Plate
//
//  Created by Akito Daiki on 01/10/2024.
//

import Foundation
import UIKit

class PropertyListView: UIView {
    
    private let headerHeight: CGFloat = 50
    
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("property_list_header", comment: "Property List Header")
        label.font = UIFont(name: "Fredoka-Bold", size: 24)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    lazy var filterButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(NSLocalizedString("filter_button_title", comment: "Filter Button"), for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont(name: "Fredoka-Regular", size: 16)
        button.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var propertyCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        backgroundColor = .white
        
        // Add subviews
        addSubview(headerLabel)
        addSubview(filterButton)
        addSubview(propertyCollectionView)
        
        // Setup constraints
        setupConstraints()
    }
    
    // MARK: - Constraints Setup
    private func setupConstraints() {
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        propertyCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Set up the header label at the top
            headerLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            headerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            headerLabel.heightAnchor.constraint(equalToConstant: headerHeight),
            
            // Set up the filter button on the right side of the header
            filterButton.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 10),
            filterButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            filterButton.heightAnchor.constraint(equalToConstant: 30),
            
            // Property collection view constraints
            propertyCollectionView.topAnchor.constraint(equalTo: filterButton.bottomAnchor, constant: 10),
            propertyCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            propertyCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            propertyCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // Filter Button Action
    @objc private func filterButtonTapped() {
        print("Filter button tapped")
        // Handle the filter button action, e.g., show filter options or navigate to a filter view
    }
}
