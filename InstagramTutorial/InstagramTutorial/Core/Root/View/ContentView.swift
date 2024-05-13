//
//  ContentView.swift
//  InstagramTutorial
//
//  Created by 양원식 on 4/30/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
            } else {
                MainTabView()
            }
        }
    }
}

#Preview {
    return ContentView()
}
