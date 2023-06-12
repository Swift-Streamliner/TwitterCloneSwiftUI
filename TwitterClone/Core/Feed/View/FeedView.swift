//
//  FeedView.swift
//  TwitterClone
//
//  Created by MEI on 01.06.2023.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView = false
    
    var body: some View {
        ZStack (alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack {
                    ForEach (0 ... 20, id: \.self) { _ in
                        TweetRowView()
                    }
                }
            }
            Button {
                showNewTweetView.toggle()
            } label: {
                Image("tweet")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28, height: 28)
                    .padding()
                
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $showNewTweetView) {
                Text("New tweet view...")
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
