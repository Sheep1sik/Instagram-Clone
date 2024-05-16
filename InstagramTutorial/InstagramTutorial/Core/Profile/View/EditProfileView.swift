//
//  EditProfileView.swift
//  InstagramTutorial
//
//  Created by 양원식 on 5/16/24.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @StateObject var viewModel: EditProfileViewModel
    @Environment(\.dismiss) var dismiss
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            VStack {
                // toolbar
                HStack {
                    Button(action: {
                        Task { try await viewModel.updateUserData() }
                        dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .imageScale(.large)
                            .foregroundColor(.black)
                    })
                    
                    Spacer()
                    
                    Text("프로필 편집")
                        .font(.headline)
                        .padding(.trailing, 14)
                    
                    Spacer()
                    
                }
                .padding(.horizontal)
                
                Divider()
                
            }
            // edit profile pic
            
            PhotosPicker(selection: $viewModel.selectedImage) {
                VStack {
                    if let image = viewModel.profileImage {
                        image
                            .resizable()
                            .foregroundColor(.white)
                            .background(.gray)
                            .clipShape(Circle())
                            .frame(width: 80, height: 80)
                    } else {
                        CircularProfileImageView(user: viewModel.user, size: .large)
                    }
                    
                    Text("사진 또는 아바타 수정")
                        .fontWeight(.semibold)
                    
                    Divider()
                }
            }
            .padding(.vertical, 15)
            
            // edit profile info
            VStack {
                EditProfileRowView(title: "이름", placeholder: viewModel.fullname, text: $viewModel.fullname)
                
                EditProfileRowView(title: "사용자 이름", placeholder: viewModel.username, text: $viewModel.username)
                
                EditProfileRowView(title: "소개", placeholder: viewModel.bio, text: $viewModel.bio)
            }
            
            Spacer()
        }
    }
}

#Preview {
    EditProfileView(user: User.MOCK_USERS[0])
}
