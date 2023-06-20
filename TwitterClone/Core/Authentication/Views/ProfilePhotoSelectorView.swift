//
//  ProfilePhotoSelectorView.swift
//  TwitterClone
//
//  Created by MEI on 20.06.2023.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    var body: some View {
        VStack {
            AuthenticationHeaderView(
                title: "Create your account",
                subTitle: "Select a profile photo"
            )
            Button {
                print("Pick image here...")
            } label: {
                Image("plus")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 180, height: 180)
                    .padding(.top, 44)
            }
            Spacer()
        }
        .ignoresSafeArea(.all)
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
