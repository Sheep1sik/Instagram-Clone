//
//  RegistrationViewModel.swift
//  InstagramTutorial
//
//  Created by 양원식 on 5/13/24.
//

import Foundation


class RegistrationViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    
    func creatUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, username: username)
    }
}
