//
//  TestViewCell.swift
//  Boiler Plate
//
//  Created by Akito Daiki on 02/10/2024.
//

import UIKit

class TestViewCell: UICollectionViewCell {
    
    var nestedViewController: NestedViewController?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupNestedView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupNestedView()
    }
    
    private func setupNestedView() {
        if nestedViewController == nil {
            nestedViewController = NestedViewController()
        }
        
        guard let nestedView = nestedViewController?.view else { return }
        nestedView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(nestedView)
        
        NSLayoutConstraint.activate([
            nestedView.topAnchor.constraint(equalTo: contentView.topAnchor),
            nestedView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nestedView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nestedView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}


//import UIKit
//import Foundation
//
//class TestViewCell: UICollectionViewCell {
//    
//    // Create an instance of NestedView
//    private let nestedView: NestedView = {
//        let view = NestedView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//    
//    // MARK: - Initializer
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupUI()
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        setupUI()
//    }
//    
//    // MARK: - UI Setup
//    private func setupUI() {
//        // Add nestedView to the cell
//        contentView.addSubview(nestedView)
//        
//        // Setup constraints
//        setupConstraints()
//    }
//    
//    // MARK: - Constraints Setup
//    private func setupConstraints() {
//        NSLayoutConstraint.activate([
//            // Make nestedView fill the entire cell
//            nestedView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            nestedView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            nestedView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            nestedView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//        ])
//    }
//}
//
