//
//  PhotoView.swift
//  InstagramTutorial
//
//  Created by 양원식 on 5/10/24.
//

import SwiftUI
import Photos

struct PhotoView: View {
    @EnvironmentObject var uploadPostViewModel: UploadPostViewModel
    
    var asset: PHAsset
    
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 4) - 1

    var body: some View {
        Image(uiImage: uploadPostViewModel.loadImage(asset: asset))
            .resizable()
            .scaledToFill()
            .frame(width: imageDimension, height: imageDimension)
            .clipped()
    }

}
#Preview {
    let dummyAsset = PHAsset()
    return PhotoView(asset: dummyAsset)
}
