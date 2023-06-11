//
//  SideMenuOptionRowView.swift
//  TwitterClone
//
//  Created by MEI on 11.06.2023.
//

import SwiftUI

struct SideMenuOptionRowView: View {
    let viewModel: SideMenuViewModel
    
    var body: some View {
        HStack (spacing: 16) {
            Image(systemName: viewModel.imageName)
                .font(.headline)
                .foregroundColor(.gray)
            Text(viewModel.title)
                .foregroundColor(.black)
                .font(.subheadline)
            Spacer()
        }
        .frame(height: 40)
        .padding(.horizontal)
    }
}

struct SideMenuOptionRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionRowView(viewModel: SideMenuViewModel.profile)
    }
}
