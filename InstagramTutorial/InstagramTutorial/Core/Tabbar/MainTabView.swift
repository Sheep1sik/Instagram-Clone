//
//  MainTabView.swift
//  InstagramTutorial
//
//  Created by 양원식 on 4/30/24.
//

import SwiftUI

struct MainTabView: View {
    
    let user: User
    @State private var selectedIndex = 0
    
    var body: some View {
        //NavigationStack {
            TabView(selection: $selectedIndex) {
                FeedView()
                    .onAppear {
                        selectedIndex = 0
                    }
                    .tabItem {
                        Image(systemName: "house")
                    }.tag(0)
                
                SearchView()
                    .onAppear {
                        selectedIndex = 1
                    }
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }.tag(1)
                
                ImageSelectionView(tabIndex: $selectedIndex)
                    .onAppear {
                        selectedIndex = 2
                    }
                    .tabItem {
                        Image(systemName: "plus.square")
                    }.tag(2)
                
                Text("Notifications")
                    .onAppear {
                        selectedIndex = 3
                    }
                    .tabItem {
                        Image(systemName: "heart")
                    }.tag(3)
                
                CurrentUserProfileView(user: user)
                    .onAppear {
                        selectedIndex = 4
                    }
                    .tabItem {
                        Image(systemName: "person")
                    }.tag(4)
            }
        //}
        .accentColor(.black)
    }
}

#Preview {
    MainTabView(user: User.MOCK_USERS[0])
}
