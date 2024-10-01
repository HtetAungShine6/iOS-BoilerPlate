//
//  apimodel.swift
//  Boiler Plate
//
//  Created by Akito Daiki on 01/10/2024.
//

import Foundation

// Model representing the status object
struct Status: Codable {
    let verified: Bool
    let sentCount: Int
}

// Model representing the cat fact
struct CatFact: Codable {
    let status: Status
    let id: String  // Mapped to _id
    let user: String
    let text: String
    let version: Int  // Mapped to __v
    let source: String
    let updatedAt: String
    let type: String
    let createdAt: String
    let deleted: Bool
    let used: Bool

    // Custom coding keys to map the JSON keys to the Swift model properties
    enum CodingKeys: String, CodingKey {
        case status
        case id = "_id"
        case user
        case text
        case version = "__v"
        case source
        case updatedAt
        case type
        case createdAt
        case deleted
        case used
    }
}
