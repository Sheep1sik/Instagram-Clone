//
//  LoginViewModel.swift
//  InstagramTutorial
//
//  Created by 양원식 on 5/13/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
    
}
