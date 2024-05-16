//
//  UserButtonOptionView.swift
//  InstagramTutorial
//
//  Created by 양원식 on 5/9/24.
//

import SwiftUI

struct UserButtonOptionView: View {
    @State private var showEditProfile = false
    
    let user: User
    
    var body: some View {
        if(user.isCurrentUser) {
            Button {
                
            } label: {
                RoundedRectangle(cornerRadius: 6)
                    .foregroundColor(Color(.systemGray5))
                    .frame(width: 370, height: 47)
                    .overlay {
                        VStack {
                            Text("프로페셔널 대시보드")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                                .padding(.leading, 10)
                            Text("최근 30일 동안 계정 106개에 도달했습니다.")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.caption2)
                                .foregroundColor(Color(.systemGray))
                                .padding(.leading, 10)
                            
                        }
                    }
            } //: BUTTON
            if(user.isCurrentUser) {
                // action button
                HStack {
                    Button {
                        showEditProfile.toggle()
                    } label: {
                        RoundedRectangle(cornerRadius: 6)
                            .foregroundColor(Color(.systemGray5))
                            .frame(width: 180, height: 32)
                            .overlay {
                                Text("프로필 편집")
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                            }
                    } //: BUTTON
                    .fullScreenCover(isPresented: $showEditProfile) {
                        EditProfileView(user: user)
                    }
                    
                    Button {
                        
                    } label: {
                        RoundedRectangle(cornerRadius: 6)
                            .foregroundColor(Color(.systemGray5))
                            .frame(width: 180, height: 32)
                            .overlay {
                                Text("프로필 공유")
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                            }
                    } //: BUTTON
                }
            }
        } else {
            HStack {
                Button {

                } label: {
                    if user.isCurrentUser {
                        RoundedRectangle(cornerRadius: 6)
                            .foregroundColor(Color(.systemGray5))
                            .frame(width: 180, height: 32)
                            .overlay {
                                HStack {
                                    Text("팔로잉")
                                        .font(.subheadline)
                                        .foregroundColor(.black)
                                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                        Image(systemName: "chevron.down")
                                            .foregroundColor(.black)
                                            .frame(width: 10, height: 10)
                                    })
                                }
                                .padding(.leading, 7)
                            }
                    } else {
                        RoundedRectangle(cornerRadius: 6)
                            .foregroundColor(Color(.systemBlue))
                            .frame(width: 180, height: 32)
                            .overlay {
                                Text("팔로우")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                        
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
        }
    }
}

#Preview {
    UserButtonOptionView(user: User.MOCK_USERS[0])
}
