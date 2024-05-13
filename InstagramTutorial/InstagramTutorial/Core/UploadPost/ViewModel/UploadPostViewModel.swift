//
//  UploadPostViewModel.swift
//  InstagramTutorial
//
//  Created by 양원식 on 5/10/24.
//

import Foundation
import PhotosUI
import SwiftUI
import Photos

@MainActor
class UploadPostViewModel: ObservableObject {
    
    @Published var postImage: Image?
    @Published var photos = [PHAsset]()
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.postImage = Image(uiImage: uiImage)
    }
    
    func requestPhotos() {
        PHPhotoLibrary.requestAuthorization { status in
            switch status {
            case .authorized:
                let fetchOptions = PHFetchOptions()
                fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
                let fetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)
                fetchResult.enumerateObjects { (asset, _, _) in
                    self.photos.append(asset)
                }
            case .denied, .restricted, .notDetermined:
                print("Access denied")
            @unknown default:
                fatalError()
            }
        }
    }
    
    
}

