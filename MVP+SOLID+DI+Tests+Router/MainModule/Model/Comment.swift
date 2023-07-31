//
//  Comment.swift
//  MVP+SOLID+DI+Tests+Router
//
//  Created by Никитин Артем on 24.07.23.
//

import Foundation

struct Comment: Decodable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
