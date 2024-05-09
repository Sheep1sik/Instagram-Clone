//
//  ProfileView.swift
//  InstagramTutorial
//
//  Created by 양원식 on 4/30/24.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
            ScrollView {
                // header
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
                            UserStatView(value: 3, title: "게시물")
                            
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
                    
                    HStack {
                        Button {
                            
                        } label: {
                            RoundedRectangle(cornerRadius: 6)
                                .foregroundColor(Color(.systemBlue))
                                .frame(width: 180, height: 32)
                                .overlay {
                                    Text("팔로우")
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                }
                        } //: BUTTON
                        Button {
                            
                        } label: {
                            RoundedRectangle(cornerRadius: 6)
                                .foregroundColor(Color(.systemGray5))
                                .frame(width: 180, height: 32)
                                .overlay {
                                    Text("메시지")
                                        .font(.subheadline)
                                        .foregroundColor(.black)
                                }
                        } //: BUTTON
                    }
                    Divider()
                } //: VSTACK
                
                // post grid view
                
                LazyVGrid(columns: gridItems, spacing: 1, content: {
                    ForEach(0 ... 3, id: \.self) { index in
                        Image(user.profileImageUrl ?? "")
                            .resizable()
                            .aspectRatio(1, contentMode: .fill)
                            .frame(maxWidth: .infinity)
                            .clipped()
                        
                    }
                })
                
            } //: SCROLL
            .navigationTitle(user.username)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Button(action: {}, label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    })
                })
            }
            .padding(.top, 10)
    }
}

#Preview {
    ProfileView(user: User.MOCK_USERS[1])
}
