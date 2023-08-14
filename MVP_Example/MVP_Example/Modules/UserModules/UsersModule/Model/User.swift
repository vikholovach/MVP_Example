//
//  Person.swift
//  MVP_Example
//
//  Created by Viktor Golovach on 10.08.2023.
//

import Foundation

//For DiffableDataSource Sections
enum Sections: Hashable {
    case user
}

//MARK: - Model
struct User: Codable, Hashable {
    let name: String
    let username: String
    let email: String
    let phone: String
    let website: String 
}
