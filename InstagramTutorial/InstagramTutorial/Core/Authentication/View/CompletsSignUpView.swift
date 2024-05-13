//
//  CompletsSignUpView.swift
//  InstagramTutorial
//
//  Created by 양원식 on 5/1/24.
//

import SwiftUI

struct CompletsSignUpView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 12) {
            
            Spacer()
            
            Text("Instagram에 오신걸 환영합니다.")
                .font(.title3)
                .fontWeight(.bold)
            
            Text("sheep1sik")
                .font(.title3)
                .fontWeight(.bold)
            
            Text("팔로우할 사람을 찾고 사진을 공유해보세요. 사용자 이름은 언제든지 변경할 수 있습니다.")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(.systemGray))
                .padding(.horizontal, 24)
            
            Button {
                print("Complete sign up")
            } label: {
                Text("다음")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)

            }
            .padding(.vertical)
            
            Spacer()
            
            HStack {
                Text("다음을 클릭하면 Instagram의 ")
                    .foregroundColor(.gray)
                +
                Text("약관")
                    .fontWeight(.bold)
                +
                Text(", ")
                    .foregroundColor(.gray)
                +
                Text("데이터 정책 ")
                    .fontWeight(.bold)
                +
                Text("및 ")
                    .foregroundColor(.gray)
                +
                Text("쿠키 정책 ")
                    .fontWeight(.bold)
                +
                Text("에 동의하게 됩니다.")
                    .foregroundColor(.gray)
            }
            .font(.footnote)
            .padding(.leading, 10)
            .padding(.trailing, 10)
            .multilineTextAlignment(.center)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

#Preview {
    CompletsSignUpView()
}
