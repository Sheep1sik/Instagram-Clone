//
//  PhotoLibraryView.swift
//  InstagramTutorial
//
//  Created by 양원식 on 5/10/24.
//

import SwiftUI
import Photos

struct PhotoLibraryView: View {
    @Binding var selectedPhoto: UIImage?
    @StateObject var viewModel = UploadPostViewModel()
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItems, spacing: 1) {
                ForEach(viewModel.photos, id: \.self) { asset in
                    Button(action: {
                        convertAssetToImage(asset)
                    }, label: {
                        PhotoView(asset: asset)
                    })
                }
            }
        }
        .onAppear {
            viewModel.requestPhotos()
            if let firstPhoto = viewModel.photos.first {
                convertAssetToImage(firstPhoto)
            }
        }
    }
    
    func convertAssetToImage(_ asset: PHAsset) {
            let manager = PHImageManager.default()
            let options = PHImageRequestOptions()
            options.isSynchronous = true
            manager.requestImage(for: asset, targetSize: CGSize(width: 300, height: 350), contentMode: .aspectFill, options: options) { image, _ in
                if let image = image {
                    selectedPhoto = image
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
    return PhotoLibraryView(selectedPhoto: .constant(nil), viewModel: viewModel)
}
