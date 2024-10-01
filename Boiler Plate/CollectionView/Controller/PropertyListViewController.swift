//
//  PropertyListViewController.swift
//  Boiler Plate
//
//  Created by Akito Daiki on 01/10/2024.
//

import UIKit

class PropertyListViewController: UIViewController {

    let propertyListView = PropertyListView()
    
    override func loadView() {
        self.view = propertyListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        delegateCV()
    }
    
    private func delegateCV() {
        propertyListView.propertyCollectionView.dataSource = self
        propertyListView.propertyCollectionView.delegate = self
        
        // If you have custom cell, register that cell here
        propertyListView.propertyCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "propertyCell")
    }
}


// MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension PropertyListViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20 // Number of items (for example purposes)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "propertyCell", for: indexPath)
        cell.backgroundColor = randomColor()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // equal size
//        let width = (collectionView.frame.width - 30) / 2 // Two columns layout
        
        // random layouts
        let width = Int.random(in: 20...150)
        let height = Int.random(in: 20...150)
        return CGSize(width: width, height: height)
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
