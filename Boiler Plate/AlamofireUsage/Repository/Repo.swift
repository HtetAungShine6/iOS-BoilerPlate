//
//  repo.swift
//  Boiler Plate
//
//  Created by Akito Daiki on 01/10/2024.
//

import Alamofire
import Foundation

class Repo {
    
    static let shared = Repo()  // Singleton instance
    
    private let baseURL = "https://cat-fact.herokuapp.com/facts"

    // Function to get cat facts data and decode it into the CatFact model
    func getCatFacts(completion: @escaping (Result<[CatFact], Error>) -> Void) {
        AF.request(baseURL, method: .get).validate().responseDecodable(of: [CatFact].self) { response in
            switch response.result {
            case .success(let catFacts):
                completion(.success(catFacts))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
