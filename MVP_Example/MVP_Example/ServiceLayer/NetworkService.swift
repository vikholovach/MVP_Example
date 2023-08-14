//
//  NetworkService.swift
//  MVP_Example
//
//  Created by Viktor Golovach on 14.08.2023.
//

import Foundation

protocol NetworkServiceProtocol: AnyObject {
    func fetchUsers() async -> (Result<[User]?, Error>)
}

class NetworkService: NetworkServiceProtocol {
    //URL to get users
    private let url = URL(string: "https://jsonplaceholder.typicode.com/users")
    
    func fetchUsers() async -> (Result<[User]?, Error>) {
        guard let url = url else {
            return .failure(NetworkServiceErrors.badURL)
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let users = try JSONDecoder().decode([User].self, from: data)
            return .success(users)
        }
        catch {
            return .failure(error)
        }
    }
    
}


