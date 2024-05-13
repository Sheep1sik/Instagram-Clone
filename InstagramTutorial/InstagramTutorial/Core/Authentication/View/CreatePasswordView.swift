//
//  CreatePasswordView.swift
//  InstagramTutorial
//
//  Created by 양원식 on 5/1/24.
//

import SwiftUI

struct CreatePasswordView: View {
    @State private var password = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 12) {
            Text("비밀번호 만들기")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("비밀번호를 저장할 수 있으므로 iCloudⓇ 기기에서 로그인 정보를 입력하지 않아도 됩니다. ")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            SecureField("비밀번호", text: $password)
                .autocapitalization(.none)
                .modifier(IGTextFieldModifier())
                .padding(.top)
            
            NavigationLink {
                CompletsSignUpView()
                    .navigationBarBackButtonHidden(true)
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
    CreatePasswordView()
}
