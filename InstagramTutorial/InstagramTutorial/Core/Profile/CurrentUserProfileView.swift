//
//  CurrentUserProfileView.swift
//  InstagramTutorial
//
//  Created by 양원식 on 5/9/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // header
                VStack(spacing: 10) {
                    // pic and stats
                    HStack {
                        Image("Profile")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        
                        Spacer()
                        
                        HStack(spacing: 8, content: {
                            UserStatView(value: 3, title: "게시물")
                            
                            UserStatView(value: 654, title: "팔로워")
                            
                            UserStatView(value: 1, title: "팔로잉")
                        }) //: HSTACK
                    } //: HSTACK
                    .padding(.horizontal)
                    
                    // name and bio
                    VStack(alignment: .leading, content: {
                        Text("양원식")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Text("iOS Developer")
                            .font(.footnote)
                    }) //: VSTACK
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    // action button
                    
                    Button {
                        
                    } label: {
                        RoundedRectangle(cornerRadius: 6)
                            .foregroundColor(Color(.systemGray5))
                            .frame(width: 360, height: 32)
                            .overlay {
                                Text("프로필 편집")
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                            }
                    } //: BUTTON
                    
                    Divider()
                } //: VSTACK
                
                // post grid view
                
                LazyVGrid(columns: gridItems, spacing: 1, content: {
                    ForEach(0 ... 15, id: \.self) { index in
                        Image("Profile")
                            .resizable()
                            .aspectRatio(1, contentMode: .fill)
                            .frame(maxWidth: .infinity)
                            .clipped()
                        
                    }
                })
                
            } //: SCROLL
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button(action: {}, label: {
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
    CurrentUserProfileView()
}
