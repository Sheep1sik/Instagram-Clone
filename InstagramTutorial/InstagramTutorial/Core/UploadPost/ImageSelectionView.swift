//
//  UploadPostView.swift
//  InstagramTutorial
//
//  Created by 양원식 on 5/10/24.
//

import SwiftUI
import PhotosUI

struct ImageSelectionView: View {
    @State private var selectedPhoto: UIImage?
    @StateObject var viewModel = UploadPostViewModel()
    @Binding var tabIndex: Int
    
    var body: some View {
        NavigationStack {
            VStack {
                // action tool bar
                HStack {
                    Button {
                        viewModel.postImage = nil
                        tabIndex = 0
                        print("Cancel upload")
                    } label: {
                        Image(systemName: "multiply")
                            .resizable()
                            .frame(width: 20,height: 20)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Text("새 게시물")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    NavigationLink (
                        destination: UploadPostView(selectedPhoto: $selectedPhoto)
                            .navigationBarBackButtonHidden(),
                        label: {
                            Text("다음")
                                .fontWeight(.semibold)
                                .foregroundColor(Color(.systemBlue))
                        }
                    )
                }
                .padding(.horizontal)
                
                // postimage and caption
                HStack {
                    if let selectedPhoto = selectedPhoto {
                        Image(uiImage: selectedPhoto)
                            .resizable()
                            .frame(width: 300,height: 350)
                            .clipped()
                    }
                }
                
                HStack {
                    Button(action: {
                        print("Click")
                    }, label: {
                        HStack {
                            Text("최근 항목")
                                .font(.headline)
                            Image(systemName: "chevron.down")
                                .resizable()
                                .frame(width: 10,height: 7)
                        
                        }
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        
                    })
                    
                    Spacer()
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Circle()
                            .frame(width: 30,height: 30)
                            .foregroundColor(Color.black)
                            .overlay{
                                Image(systemName: "square.on.square")
                                    .foregroundColor(.white)
                            }
                            .overlay(Circle().strokeBorder(Color.gray, lineWidth: 1))
                    })
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Circle()
                            .frame(width: 30,height: 30)
                            .foregroundColor(Color.black)
                            .overlay{
                                Image(systemName: "camera")
                                    .foregroundColor(.white)
                            }
                            .overlay(Circle().strokeBorder(Color.gray, lineWidth: 1))
                    })
                }
                .padding(.horizontal)
                .padding(.vertical)
                
                PhotoLibraryView(selectedPhoto: $selectedPhoto, viewModel: viewModel)
        
            }
            .photosPickerStyle(.presentation)
            .background(Color.black)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

#Preview {
    ImageSelectionView(tabIndex: .constant(0))
}
