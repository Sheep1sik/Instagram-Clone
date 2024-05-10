//
//  User.swift
//  InstagramTutorial
//
//  Created by 양원식 on 5/9/24.
//

import Foundation

class User: Identifiable, Codable, Equatable, Hashable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    var email: String
    var userFollow: Bool
    
    init(id: String, username: String, profileImageUrl: String?, fullname: String?, bio: String?, email: String, userFollow: Bool) {
        self.id = id
        self.username = username
        self.profileImageUrl = profileImageUrl
        self.fullname = fullname
        self.bio = bio
        self.email = email
        self.userFollow = userFollow
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    func follow() -> Bool {
        return !userFollow
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        User(id: NSUUID().uuidString, username: "sheep1sik", profileImageUrl: "User_sheep1sik", fullname: "양원식", bio: "iOS Developer", email: "sheep1sik@gmail.com", userFollow: true),
        User(id: NSUUID().uuidString, username: "b2_iiin", profileImageUrl: "User_b2_iiin", fullname: "서빈", bio: "빛날 빈 彬", email: "b2_iiin@gmail.com", userFollow: true)
    ]
}

