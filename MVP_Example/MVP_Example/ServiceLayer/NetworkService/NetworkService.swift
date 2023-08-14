//
//  NetworkService.swift
//  MVP_Example
//
//  Created by Viktor Golovach on 14.08.2023.
//

import Foundation

protocol NetworkServiceProtocol: AnyObject {
    func fetchUsers() async -> (Result<[User]?, Error>)
    func fetchComments() async -> (Result<[Comment]?, Error>)
}

class NetworkService: NetworkServiceProtocol {
    //URL to get users
    private let usersUrl = URL(string: "https://jsonplaceholder.typicode.com/users")
    private let commentsUrl = URL(string: "https://jsonplaceholder.typicode.com/comments")
    
    func fetchUsers() async -> (Result<[User]?, Error>) {
        guard let url = usersUrl else {
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
    
    func fetchComments() async -> (Result<[Comment]?, Error>) {
        guard let url = commentsUrl else {
            return .failure(NetworkServiceErrors.badURL)
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let comments = try JSONDecoder().decode([Comment].self, from: data)
            return .success(comments)
        }
        catch {
            return .failure(error)
        }
    }
    
}


