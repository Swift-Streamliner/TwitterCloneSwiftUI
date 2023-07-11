//
//  ExploreView.swift
//  TwitterClone
//
//  Created by MEI on 07.06.2023.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var exploreViewModel = ExploreViewModel()
    
    var body: some View {
        VStack {
            SearchBar(text: $exploreViewModel.seachText)
                .padding()
            ScrollView {
                LazyVStack {
                    ForEach(exploreViewModel.searchableUsers, id: \.self) { user in
                        NavigationLink {
                            ProfileView(user: user)
                        } label: {
                            UserRowView(user: user)
                        }
                    }
                }
            }
        }
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
