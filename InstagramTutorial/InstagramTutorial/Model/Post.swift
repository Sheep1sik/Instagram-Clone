//
//  Post.swift
//  InstagramTutorial
//
//  Created by 양원식 on 5/9/24.
//

import Foundation

struct Post: Identifiable, Hashable, Codable {
    let id : String
    let ownerUid: String
    let caption: String?
    var likes: Int
    var likesPublic: Bool
    var commentsEnabled: Bool
    let imageUrl: String
    let timestamp: Date
    var user: User?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "원식아 하트해 !",
            likes: 443,
            likesPublic: true,
            commentsEnabled: true,
            imageUrl: "User_b2_iiin_Post1",
            timestamp: Date(),
            user: User.MOCK_USERS[1]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "나랑 앞으로도 재밌게 놀쟈 🫶🏻",
            likes: 424,
            likesPublic: true,
            commentsEnabled: true,
            imageUrl: "User_b2_iiin_Post2",
            timestamp: Date(),
            user: User.MOCK_USERS[1]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: nil,
            likes: 443,
            likesPublic: false,
            commentsEnabled: false,
            imageUrl: "User_b2_iiin_Post3",
            timestamp: Date(),
            user: User.MOCK_USERS[1]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "우리의 1년 기록하기 🤍",
            likes: 468,
            likesPublic: true,
            commentsEnabled: true,
            imageUrl: "User_b2_iiin_Post4",
            timestamp: Date(),
            user: User.MOCK_USERS[1]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "완전한 내 타입 메-롱",
            likes: 419,
            likesPublic: false,
            commentsEnabled: false,
            imageUrl: "User_b2_iiin_Post5",
            timestamp: Date(),
            user: User.MOCK_USERS[1]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "🐶🫧☁️🤍",
            likes: 419,
            likesPublic: false,
            commentsEnabled: false,
            imageUrl: "User_b2_iiin_Post6",
            timestamp: Date(),
            user: User.MOCK_USERS[1]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "생일 축하해 주신 분들 감사합니다😆😆",
            likes: 150,
            likesPublic: true,
            commentsEnabled: true,
            imageUrl: "User_sheep1sik_Post1",
            timestamp: Date(),
            user: User.MOCK_USERS[0]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "이모 여기 사기꾼 추가요~~🍚🍚",
            likes: 195,
            likesPublic: true,
            commentsEnabled: false,
            imageUrl: "User_sheep1sik_Post2",
            timestamp: Date(),
            user: User.MOCK_USERS[0]
        ),
    ]
}
