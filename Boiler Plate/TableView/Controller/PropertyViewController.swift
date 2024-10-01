//
//  PropertyViewController.swift
//  Boiler Plate
//
//  Created by Akito Daiki on 01/10/2024.
//

import UIKit

class PropertyViewController: UIViewController {
    
    let propertyView = PropertyView()
    
    // Dummy data: Array of random property names
    let propertyNames = [
        "Sunny Apartment",
        "Luxury Condo",
        "Cozy Cottage",
        "Modern Villa",
        "Beachfront House",
        "Urban Studio",
        "Countryside Farmhouse",
        "Mountain Cabin",
        "City Loft",
        "Spacious Penthouse"
    ]
    
    override func loadView() {
        self.view = propertyView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        delegateTV()
    }
    
    private func delegateTV() {
        propertyView.tableView.dataSource = self
        propertyView.tableView.delegate = self
        propertyView.tableView.register(PropertyTableViewCell.self, forCellReuseIdentifier: "propertyCell")
    }

}


// MARK: - UITableViewDataSource & UITableViewDelegate
extension PropertyViewController: UITableViewDataSource, UITableViewDelegate {
    
    // Number of rows in the table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return propertyNames.count // Number of dummy items
    }
    
    // Create each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "propertyCell", for: indexPath) as! PropertyTableViewCell
        cell.textLabel?.text = propertyNames[indexPath.row] // Set the property name as the cell title
        return cell
    }
    
    // Handle row selection
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected property: \(propertyNames[indexPath.row])")
    }
}
