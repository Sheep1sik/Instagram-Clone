//
//  FeedCell.swift
//  InstagramTutorial
//
//  Created by 양원식 on 4/30/24.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack {
            // image + username
            HStack {
                Image("Post1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                Text("Sheep1sik")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Spacer()
                
            } //: HSTACK
            .padding(.leading, 8)
            
            // post image
            
            Image("Post2")
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
                
                Button(action: {
                    print("Comment on post")
                }, label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                })
                
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
            
            // likes label
            Text("23 likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 8)
                .padding(.top, 1)
            
            // caption label
            
            HStack {
                Text("Sheep1sik").fontWeight(.semibold) +
                Text(" 쁘이 ✌🏻")
            } //: HSTACK
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 8)
            .padding(.top, 1)
            .font(.footnote)
            
            Text("6h age")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 8)
                .padding(.top, 1)
                .foregroundColor(.gray)
            
        } //: VSTACK
    }
}

#Preview {
    FeedCell()
}
