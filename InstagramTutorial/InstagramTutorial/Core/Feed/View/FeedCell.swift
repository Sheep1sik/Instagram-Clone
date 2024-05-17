//
//  FeedCell.swift
//  InstagramTutorial
//
//  Created by 양원식 on 4/30/24.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    let post: Post
    
    var body: some View {
        VStack {
            // image + username
            HStack {
                if let user = post.user {
                    CircularProfileImageView(user: user, size: .xSmall)
                    
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
                Spacer()
                
            } //: HSTACK
            .padding(.leading, 8)
            
            // post image
            
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            // action buttons
            HStack {
                Button(action: {
                    print("Like post")
                }, label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                })
                if !post.commentsEnabled {
                    Button(action: {
                        print("Comment on post")
                    }, label: {
                        Image(systemName: "bubble.right")
                            .imageScale(.large)
                    })
                }
                Button(action: {
                    print("Share post")
                }, label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                })
                
                Spacer()
            } //: HSTACK
            .padding(.leading, 8)
            .padding(.top, 4)
            .foregroundColor(.black)
            
            HStack {
                // likes label
                Text("\(!post.commentsEnabled ? String(post.likes) : "여러")명")
                    .font(.footnote)
                    .fontWeight(.semibold)
                +
                Text("이 좋아합니다.")
                    .font(.footnote)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 8)
            .padding(.top, 1)
            // caption label
            
            HStack {
                Text("\(post.user?.username ?? "") ").fontWeight(.semibold) +
                Text(post.caption ?? "")
            } //: HSTACK
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 8)
            .padding(.top, 1)
            .font(.footnote)
            
            Text("6시간 전")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 8)
                .padding(.top, 1)
                .foregroundColor(.gray)
            
        } //: VSTACK
    }
}

#Preview {
    FeedCell(post: Post.MOCK_POSTS[0])
}
