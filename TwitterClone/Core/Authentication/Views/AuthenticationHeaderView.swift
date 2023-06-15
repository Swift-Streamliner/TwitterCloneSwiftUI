//
//  AuthenticationHeaderView.swift
//  TwitterClone
//
//  Created by MEI on 15.06.2023.
//

import SwiftUI

struct AuthenticationHeaderView: View {
    var title: String
    var subTitle: String
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Spacer()
            }
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(subTitle)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .frame(height: 260)
        .padding(.leading)
        .background(Color(.systemBlue))
        .foregroundColor(.white)
        .clipShape(RoundedShape(corners: [.bottomRight]))
    }
}

struct AuthenticationHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationHeaderView(title: "Hello.", subTitle: "Welcome Back")
    }
}
