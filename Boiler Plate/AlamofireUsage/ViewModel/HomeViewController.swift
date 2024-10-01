//
//  HomeViewController.swift
//  Boiler Plate
//
//  Created by Akito Daiki on 01/10/2024.
//

import UIKit

class HomeViewController: UIViewController {

    let homeView = HomeView()
    var catFact: [CatFact] = []
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        delegateTV()
        fetchCatFacts()
    }
    
    private func delegateTV() {
        homeView.tableView.dataSource = self
        homeView.tableView.delegate = self
        homeView.tableView.register(HomeViewCell.self, forCellReuseIdentifier: "HomeViewCell")
    }

}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catFact.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeViewCell", for: indexPath) as? HomeViewCell else {
            return UITableViewCell()
        }
        // Configure your custom cell
        let cat = catFact[indexPath.row]
        cell.configure(with: cat)
        return cell
    }
    
    // MARK: - UITableViewDelegate Methods (optional)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected row: \(indexPath.row)")
    }
}

extension HomeViewController {
    // Fetch cat facts from the API
    private func fetchCatFacts() {
        Repo.shared.getCatFacts { [weak self] result in
            switch result {
            case .success(let facts):
                self?.catFact = facts
                DispatchQueue.main.async {
                    self?.homeView.tableView.reloadData()
                }
            case .failure(let error):
                print("Failed to fetch cat facts: \(error)")
            }
        }
    }
}
