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
                        .resizable()
                        .modifier(ProfileImageModifier())
                        .clipShape(Circle())
                } else {
                    Image("plus")
                        .resizable()
                        .modifier(ProfileImageModifier())
                }
            }
            .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                ImagePicker(image: $image)
            }
            .padding(.top, 44)
            
            if profileImage != nil {
                Button {
                    print("DBG: Finish registering user...")
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            }
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
