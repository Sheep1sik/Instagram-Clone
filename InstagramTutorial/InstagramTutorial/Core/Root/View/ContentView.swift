//
//  ContentView.swift
//  InstagramTutorial
//
//  Created by 양원식 on 4/30/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @StateObject var registrationViewModel = RegistrationViewModel()
    @StateObject var uploadPostViewModel = UploadPostViewModel()
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
                    .environmentObject(registrationViewModel)
            } else {
                MainTabView()
                    .environmentObject(uploadPostViewModel)
            }
        }
    }
}

#Preview {
    return ContentView()
}
