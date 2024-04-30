//
//  SearchView.swift
//  InstagramTutorial
//
//  Created by 양원식 on 4/30/24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    
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
                    ForEach(0 ... 15, id: \.self) { user in
                        HStack {
                            Image("User_b2_iiin")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text("b2_iiin")
                                    .fontWeight(.semibold)
                                
                                Text("서빈 • sheep1sik님 외 4명이 팔로우합니다")
                                    .foregroundColor(.gray)
                            } //: VSTACK
                            .font(.footnote)
                            
                            Spacer()
                        } //: HSTACK
                        .padding(.horizontal)
                    } //: LOOP
                } //: LAZY
                .padding(.top, 8)
                .searchable(text: $searchText, prompt: "Search...")
            } //: SCROLL
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        } //: NAVIGATION
    }
}

#Preview {
    SearchView()
}
