//
//  PhotoLibraryView.swift
//  InstagramTutorial
//
//  Created by 양원식 on 5/10/24.
//

import SwiftUI
import Photos

struct PhotoLibraryView: View {
    @EnvironmentObject var uploadPostViewModel: UploadPostViewModel
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItems, spacing: 1) {
                ForEach(uploadPostViewModel.photos, id: \.self) { asset in
                    Button(action: {
                        uploadPostViewModel.convertAssetToImage(asset)
                    }, label: {
                        PhotoView(asset: asset)
                    })
                }
            }
        }
        .onAppear {
            uploadPostViewModel.requestPhotos()
            if let firstPhoto = uploadPostViewModel.photos.first {
                uploadPostViewModel.convertAssetToImage(firstPhoto)
            }
        }
    }
    
}

#Preview {
    let viewModel = UploadPostViewModel()
            viewModel.photos = [
                PHAsset(), PHAsset(), PHAsset(), PHAsset(),
                PHAsset(), PHAsset(), PHAsset(), PHAsset()
            ]
    return PhotoLibraryView()
}
