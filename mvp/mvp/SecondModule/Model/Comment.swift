//
//  Comment.swift
//  mvp
//
//  Created by Дмитрий Цветков on 26.07.2023.
//

import Foundation

struct Comment: Decodable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
