//
//  LoginView.swift
//  InstagramTutorial
//
//  Created by 양원식 on 5/1/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                
                Image("Instagram_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
                
                VStack {
                    TextField("전화번호, 이메일, 사용자 이름", text: $viewModel.email)
                        .autocapitalization(.none)
                        .modifier(IGTextFieldModifier())
                    
                    SecureField("비밀번호", text: $viewModel.password)
                        .modifier(IGTextFieldModifier())
                    
                } //: VSTACK
                
                Button {
                    print("Show forgot password")
                } label: {
                    Text("비밀번호를 잊으셨나요?")
                        .font(.footnote)
                        .padding(.top)
                        .padding(.trailing, 28)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                Button {
                    Task { try await viewModel.signIn()}
                    print("Login")
                } label: {
                    Text("로그인")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(8)
                }
                .padding(.vertical)
                
                HStack {
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                    
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                }
                .foregroundColor(.gray)
                
                HStack {
                    Image("Facebook_logo")
                        .resizable()
                        .frame(width: 20,height: 20)
                    
                    Text("Facebook으로 로그인")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemBlue))
                }
                .padding(.top, 8)
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    AddEmailView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("계정이 없으신가요?")
                            .foregroundColor(Color(.systemGray))
                        
                        Text("가입하기")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.vertical, 16)
                
            } //: VSTACK
        } //: NAVIGATION
    }
}

#Preview {
    LoginView()
}
