//
//  TestViewController.swift
//  Boiler Plate
//
//  Created by Akito Daiki on 02/10/2024.
//

import Foundation
import UIKit

class TestViewController: UIViewController {
    
    let testView = TestView()
    
    override func loadView() {
        self.view = testView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegateCV()
    }
    
    private func delegateCV() {
        testView.propertyCollectionView.dataSource = self
        testView.propertyCollectionView.delegate = self
        
        // If you have custom cell, register that cell here
        testView.propertyCollectionView.register(TestViewCell.self, forCellWithReuseIdentifier: "testCell")
    }
    
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension TestViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "testCell", for: indexPath) as! TestViewCell
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
