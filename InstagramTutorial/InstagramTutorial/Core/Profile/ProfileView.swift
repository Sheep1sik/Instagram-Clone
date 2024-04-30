//
//  ProfileView.swift
//  InstagramTutorial
//
//  Created by 양원식 on 4/30/24.
//

import SwiftUI

struct ProfileView: View {
    
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
                            UserStatView(value: 3, title: "Posts")
                            
                            UserStatView(value: 654, title: "Followers")
                            
                            UserStatView(value: 1, title: "Following")
                        }) //: HSTACK
                    } //: HSTACK
                    .padding(.horizontal)
                    
                    // name and bio
                    VStack(alignment: .leading, content: {
                        Text("Sheep1sik")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Text("Aspiring iOS Developer")
                            .font(.footnote)
                    }) //: VSTACK
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    // action button
                    
                    Button {
                        
                    } label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 360, height: 32)
                            .foregroundColor(.black)
                            .overlay(content: {
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color.gray, lineWidth: 1)
                            })
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
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button(action: {}, label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    })
                })
            }
        } //: NAVIGATION
    }
}

#Preview {
    ProfileView()
}
