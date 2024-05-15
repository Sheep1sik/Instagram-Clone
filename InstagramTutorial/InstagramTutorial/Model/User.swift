//
//  User.swift
//  InstagramTutorial
//
//  Created by 양원식 on 5/9/24.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    var email: String
    
}

extension User {
    static var MOCK_USERS: [User] = [
        User(id: NSUUID().uuidString, username: "sheep1sik", profileImageUrl: "User_sheep1sik", fullname: "양원식", bio: "iOS Developer", email: "sheep1sik@gmail.com"),
        User(id: NSUUID().uuidString, username: "b2_iiin", profileImageUrl: "User_b2_iiin", fullname: "서빈", bio: "빛날 빈 彬", email: "b2_iiin@gmail.com")
    ]
}

