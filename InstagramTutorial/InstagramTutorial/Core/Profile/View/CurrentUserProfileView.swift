//
//  CurrentUserProfileView.swift
//  InstagramTutorial
//
//  Created by 양원식 on 5/9/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    let user: User
    
    
    var posts: [Post] {
        return Post.MOCK_POSTS.filter({$0.user?.username == user.username})
    }
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // header
                ProfileHeaderView(user: user)
                
                // post grid view
                
                PostGridView(posts: posts)
                
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
                    Text("sheep1sik")
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
