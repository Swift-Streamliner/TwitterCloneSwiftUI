//
//  ProfilePhotoSelectorView.swift
//  TwitterClone
//
//  Created by MEI on 20.06.2023.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var image: UIImage?
    @State private var profileImage: Image?
    
    var body: some View {
        VStack {
            AuthenticationHeaderView(
                title: "Create your account",
                subTitle: "Select a profile photo"
            )
            Button {
                showImagePicker.toggle()
            } label: {
                if let profileImage = profileImage {
                    profileImage
                        .modifier(ProfileImageModifier())
                        .clipShape(Circle())
                } else {
                    Image("plus")
                        .modifier(ProfileImageModifier())
                }
            }
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(image: $image)
            }
            .padding(.top, 44)
            Spacer()
        }
        .ignoresSafeArea(.all)
    }
    
    func loadImage() {
        guard let selectedImage = image else { return }
        profileImage = Image(uiImage: selectedImage)
        
    }
}

private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .frame(width: 180, height: 180)
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
