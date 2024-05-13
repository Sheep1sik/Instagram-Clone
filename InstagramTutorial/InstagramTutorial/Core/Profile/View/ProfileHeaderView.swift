//
//  ProfileHeaderView.swift
//  InstagramTutorial
//
//  Created by 양원식 on 5/10/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    let user: User
    
    var posts: [Post] {
        return Post.MOCK_POSTS.filter({$0.user?.username == user.username})
    }
    
    var body: some View {
        VStack(spacing: 10) {
            // pic and stats
            HStack {
                Image(user.profileImageUrl ?? "")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                
                Spacer()
                
                HStack(spacing: 8, content: {
                    UserStatView(value: posts.count, title: "게시물")
                    
                    UserStatView(value: 654, title: "팔로워")
                    
                    UserStatView(value: 1, title: "팔로잉")
                }) //: HSTACK
            } //: HSTACK
            .padding(.horizontal)
            
            // name and bio
            VStack(alignment: .leading, content: {
                if let fullname = user.fullname {
                    Text(fullname)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                if let bio = user.bio {
                    Text(bio)
                        .font(.footnote)
                }
            }) //: VSTACK
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            // action button
            
            UserButtonOptionView(userViewModel: UserProfileViewModel(user: user))
            
            Divider()
        }
    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USERS[1])
}
