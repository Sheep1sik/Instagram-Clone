//
//  SearchView.swift
//  InstagramTutorial
//
//  Created by 양원식 on 4/30/24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @StateObject var viewModel  = SearchViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    HStack {
                        Text("최근 검색")
                            .fontWeight(.semibold)
                        Spacer()
                    } //: HSTACK
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            HStack {
                                CircularProfileImageView(user: user, size: .xSmall)
                                
                                VStack(alignment: .leading) {
                                    Text(user.username)
                                        .fontWeight(.semibold)
                                    
                                    if let fullname = user.fullname {
                                        Text(fullname)
                                            .foregroundColor(.gray)
                                    }
                                } //: VSTACK
                                .font(.footnote)
                                
                                Spacer()
                            } //: HSTACK
                            .foregroundColor(.black)
                            .padding(.horizontal)
                        }
                    } //: LOOP
                } //: LAZY
                .padding(.top, 8)
                .searchable(text: $searchText, prompt: "검색")
            } //: SCROLL
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
        } //: NAVIGATION
    }
}

#Preview {
    SearchView()
}
