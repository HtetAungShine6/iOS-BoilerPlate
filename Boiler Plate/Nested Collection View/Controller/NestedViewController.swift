//
//  NestedViewController.swift
//  Boiler Plate
//
//  Created by Akito Daiki on 02/10/2024.
//


import Foundation
import UIKit

class NestedViewController: UIViewController {
    
    let nestedView = NestedView()
    
    override func loadView() {
        self.view = nestedView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegateCV()
    }
    
    private func delegateCV() {
        nestedView.nestCollectionView.dataSource = self
        nestedView.nestCollectionView.delegate = self
        
        // If you have custom cell, register that cell here
        nestedView.nestCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "nestCell")
    }
    
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension NestedViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "nestCell", for: indexPath)
        cell.backgroundColor = randomColor()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // equal size
        let width = collectionView.frame.width // Two columns layout
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Hi")
    }
    
    // Create random colors
    func randomColor() -> UIColor {
        let red = CGFloat(arc4random_uniform(256)) / 255.0
        let green = CGFloat(arc4random_uniform(256)) / 255.0
        let blue = CGFloat(arc4random_uniform(256)) / 255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
