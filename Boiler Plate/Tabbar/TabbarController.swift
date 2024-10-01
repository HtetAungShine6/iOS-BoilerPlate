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
        
        // Embed each view controller in a navigation controller (optional)
        let homeNav = UINavigationController(rootViewController: homeVC)
        let settingNav = UINavigationController(rootViewController: settingVC)
        
        // Set the tab bar items with titles and images
        homeNav.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        settingNav.tabBarItem = UITabBarItem(title: "Setting", image: UIImage(systemName: "gear.circle"), selectedImage: UIImage(systemName: "gear.circle.fill"))
        
        // Assign the view controllers to the tab bar
        self.viewControllers = [homeNav, settingNav]
        
        // Optional: Customize the tab bar appearance
        tabBar.tintColor = UIColor.systemBlue
        tabBar.unselectedItemTintColor = UIColor.gray
        tabBar.backgroundColor = UIColor.white
    }
    
}
