//
//  UserService.swift
//  InstagramTutorial
//
//  Created by 양원식 on 5/15/24.
//

import Foundation
import Firebase

struct UserService {
    
    static func fetchUser(withUid uid: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        return try snapshot.data(as:User.self)
    }
    
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        let documents = snapshot.documents
        
        return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
    }
}
