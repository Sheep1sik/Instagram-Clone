//
//  ProfileView.swift
//  InstagramTutorial
//
//  Created by 양원식 on 4/30/24.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    @Environment(\.dismiss) var dismiss
    
    var posts: [Post] {
        return Post.MOCK_POSTS.filter({$0.user?.username == user.username})
    }
    
    var body: some View {
        ScrollView {
            // header
            ProfileHeaderView(user: user)
            // post grid view
            
            PostGridView(posts: posts)
            
            
        } //: SCROLL
        .navigationTitle(user.username)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing, content: {
                Image(systemName: "line.3.horizontal")
                    .foregroundColor(.black)
                    .onTapGesture {
                        dismiss()
                    }
            })
        }
        .padding(.top, 10)
    }
}

#Preview {
    ProfileView(user: User.MOCK_USERS[1])
}
