//
//  UploadPostView.swift
//  InstagramTutorial
//
//  Created by 양원식 on 5/10/24.
//

import SwiftUI

struct UploadPostView: View {
    @State var caption = ""
    @EnvironmentObject var uploadPostViewModel: UploadPostViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .foregroundColor(.black)
                        .onTapGesture {
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
            }
            
            
            Spacer()
            
            Divider()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
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
    UploadPostView()
}
