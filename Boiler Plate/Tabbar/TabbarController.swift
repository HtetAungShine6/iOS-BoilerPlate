//
//  TabbarController.swift
//  Boiler Plate
//
//  Created by Akito Daiki on 01/10/2024.
//

import Foundation
import UIKit

class TabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize the view controllers
        let homeVC = HomeViewController()
        let settingVC = SettingViewController()
        let propertyListVC = PropertyListViewController()
        let propertyVC = PropertyViewController()
        let testVC = TestViewController()
        
        // Embed each view controller in a navigation controller (optional)
        let homeNav = UINavigationController(rootViewController: homeVC)
        let settingNav = UINavigationController(rootViewController: settingVC)
        let propertyListNav = UINavigationController(rootViewController: propertyListVC)
        let propertyNav = UINavigationController(rootViewController: propertyVC)
        let testNav = UINavigationController(rootViewController: testVC)
        
        // Set the tab bar items with titles and images
        homeNav.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        settingNav.tabBarItem = UITabBarItem(title: "Setting", image: UIImage(systemName: "gear.circle"), selectedImage: UIImage(systemName: "gear.circle.fill"))
        propertyListNav.tabBarItem = UITabBarItem(title: "Property", image: UIImage(systemName: "building.2"), selectedImage: UIImage(systemName: "building.2.fill"))
        propertyNav.tabBarItem = UITabBarItem(title: "Property", image: UIImage(systemName: "building.columns"), selectedImage: UIImage(systemName: "building.columns.fill"))
        testNav.tabBarItem = UITabBarItem(title: "Property", image: UIImage(systemName: "phone.down"), selectedImage: UIImage(systemName: "phone.down.fill"))
        
        // Assign the view controllers to the tab bar
        self.viewControllers = [homeNav, settingNav, propertyListNav, propertyNav, testNav]
        
        // Optional: Customize the tab bar appearance
        tabBar.tintColor = UIColor.systemBlue
        tabBar.unselectedItemTintColor = UIColor.gray
        tabBar.backgroundColor = UIColor.white
    }
    
}
