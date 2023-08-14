//
//  CommentModel.swift
//  MVP_Example
//
//  Created by Viktor Golovach on 14.08.2023.
//

import Foundation

struct Comment: Codable, Hashable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
