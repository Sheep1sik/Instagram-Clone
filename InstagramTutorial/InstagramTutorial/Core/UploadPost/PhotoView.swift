//
//  PhotoView.swift
//  InstagramTutorial
//
//  Created by 양원식 on 5/10/24.
//

import SwiftUI
import Photos

struct PhotoView: View {
    var asset: PHAsset
    
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 4) - 1

    var body: some View {
        Image(uiImage: loadImage(asset: asset))
            .resizable()
            .scaledToFill()
            .frame(width: imageDimension, height: imageDimension)
            .clipped()
    }

    func loadImage(asset: PHAsset) -> UIImage {
        let manager = PHImageManager.default()
        let options = PHImageRequestOptions()
        var thumbnail = UIImage()
        options.isSynchronous = true
        manager.requestImage(for: asset, targetSize: CGSize(width: imageDimension, height: imageDimension), contentMode: .aspectFill, options: options) { image, _ in
            if let image = image {
                thumbnail = image
            }
        }
        return thumbnail
    }
}
#Preview {
    let dummyAsset = PHAsset()
    return PhotoView(asset: dummyAsset)
}
