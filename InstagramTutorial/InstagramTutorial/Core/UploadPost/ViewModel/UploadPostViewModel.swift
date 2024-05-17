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
import Firebase

class UploadPostViewModel: ObservableObject {
    
    @Published var postImage: UIImage?
    @Published var photos = [PHAsset]()
    
    
    let imageDimension: CGFloat = (UIScreen.main.bounds.width / 1.7) - 1
    
    func requestPhotos() {
        PHPhotoLibrary.requestAuthorization { [weak self] status in
            guard let self = self else { return }
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
    
    @MainActor
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
    
    @MainActor
    func convertAssetToImage(_ asset: PHAsset) {
        let manager = PHImageManager.default()
        let options = PHImageRequestOptions()
        options.isSynchronous = true
        manager.requestImage(for: asset, targetSize: CGSize(width: 300, height: 350), contentMode: .aspectFill, options: options) { image, _ in
            if let image = image {
                self.postImage = image
            }
        }
    }
    
    func uploadPost(caption: String, likesPublic: Bool, commentsEnabled: Bool) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let uiImage = postImage else { return }
        
        let postRef = Firestore.firestore().collection("posts").document()
        guard let imageUrl = try await ImageUploader.uploadImage(image: uiImage) else { return }
        let post = Post(id: postRef.documentID, ownerUid: uid, caption: caption, likes: 0, likesPublic: likesPublic, commentsEnabled: commentsEnabled, imageUrl: imageUrl, timestamp: Timestamp())
        
        guard let encodedPost = try? Firestore.Encoder().encode(post) else { return }
        
        try await postRef.setData(encodedPost)
    }
    
}

