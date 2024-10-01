//
//  NestedView.swift
//  Boiler Plate
//
//  Created by Akito Daiki on 02/10/2024.
//

import UIKit
import Foundation

class NestedView: UIView {
    
    private let headerHeight: CGFloat = 50
    
    lazy var nestCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
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
        addSubview(nestCollectionView)
        
        // Setup constraints
        setupConstraints()
    }
    
    // MARK: - Constraints Setup
    private func setupConstraints() {
        nestCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Property collection view constraints
            nestCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            nestCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            nestCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            nestCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // Filter Button Action
    @objc private func filterButtonTapped() {
        print("Filter button tapped")
        // Handle the filter button action, e.g., show filter options or navigate to a filter view
    }
}
