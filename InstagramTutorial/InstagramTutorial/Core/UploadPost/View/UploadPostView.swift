//
//  UploadPostView.swift
//  InstagramTutorial
//
//  Created by 양원식 on 5/10/24.
//

import SwiftUI

struct UploadPostView: View {
    @State var caption = ""
    @State var likesPublic = false
    @State var commentsEnabled = false
    @EnvironmentObject var uploadPostViewModel: UploadPostViewModel
    @Binding var tabIndex: Int
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .foregroundColor(.black)
                        .onTapGesture {
                            caption = ""
                            likesPublic = false
                            commentsEnabled = false
                            dismiss()
                        }
                })
                
                Spacer()
                
                Text("새 게시물")
                    .fontWeight(.semibold)
                    .padding(.trailing, 15)
                
                Spacer()
            }
            
            Divider()
            
            ScrollView {
                
                if let image = uploadPostViewModel.postImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: uploadPostViewModel.imageDimension, height: uploadPostViewModel.imageDimension)
                        .clipShape(RoundedRectangle(cornerRadius: 9))
                        .padding(.top)
                }
                
                HStack(spacing: 8) {
                    TextField("문구를 작성하거나 설문을 추가하세요...", text: $caption, axis: .vertical)
                        .padding(.top)
                }
                .padding(.bottom, 50)
                
                
                VStack {
                    
                    Divider()
                    
                    HStack {
                        Text("좋아요 수 및 조회수")
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Toggle("이 게시물의 좋아요 수 및 조회수 숨기기", isOn: $likesPublic)
                            .toggleStyle(SwitchToggleStyle(tint: Color(.systemBlue)))
                        
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("댓글")
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    
                    HStack {
                        Toggle("댓글 기능 해제", isOn: $commentsEnabled)
                            .toggleStyle(SwitchToggleStyle(tint: Color(.systemBlue)))
                        
                    }
                }
            }
                
            
            Divider()
            
            Button(action: {
                Task {
                    try await uploadPostViewModel.uploadPost(caption: caption, likesPublic: likesPublic, commentsEnabled: commentsEnabled)
                    
                    dismiss()
                    caption = ""
                    likesPublic = false
                    commentsEnabled = false
                    tabIndex = 0
                }
            }, label: {
                RoundedRectangle(cornerRadius: 7)
                    .frame(width: 300, height: 33)
                    .foregroundColor(Color(.systemBlue))
                    .overlay {
                        Text("공유")
                            .foregroundColor(.white)
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                
            })
            .padding(.vertical, 10)
        }
        .padding(.horizontal)
    }
}

#Preview {
    UploadPostView(tabIndex: .constant(0))
}
