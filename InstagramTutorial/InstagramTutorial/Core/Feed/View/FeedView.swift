//
//  FeedView.swift
//  InstagramTutorial
//
//  Created by 양원식 on 4/30/24.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 32) {
                    ForEach(viewModel.posts) { post in
                        FeedCell(post: post)
                    } //: LOOP
                } //: LAZY
                .padding(.top, 8)
            } //: SCROLL
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("Instagram_logo")
                        .resizable()
                        .frame(width: 120, height: 45)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "heart")
                        .imageScale(.large)
                        .padding(.trailing, 10)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
            }
        } //: NAVIGATION
    }
}

#Preview {
    FeedView()
}
