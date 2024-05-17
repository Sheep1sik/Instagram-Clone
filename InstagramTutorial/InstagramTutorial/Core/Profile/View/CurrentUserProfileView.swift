//
//  CurrentUserProfileView.swift
//  InstagramTutorial
//
//  Created by 양원식 on 5/9/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    let user: User
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // header
                ProfileHeaderView(user: user)
                
                // post grid view
                
                PostGridView(user: user)
                
            } //: SCROLL
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button(action: {
                        AuthService.shared.signout()
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    })
                })
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Text(user.username)
                        .font(.title2)
                        .fontWeight(.bold)
                }
            }
            .padding(.top, 10)
        } //: NAVIGATION
    }
}
#Preview {
    CurrentUserProfileView(user: User.MOCK_USERS[0])
}
