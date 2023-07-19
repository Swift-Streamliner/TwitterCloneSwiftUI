//
//  TweetRowViewModel.swift
//  TwitterClone
//
//  Created by MEI on 19.07.2023.
//

import Foundation

class TweetRowViewModel : ObservableObject {
    private let service = TweetService()
    @Published var tweet: Tweet
    
    init(tweet: Tweet) {
        self.tweet = tweet
    }
    
    func likeTweet() {
        service.likeTweet(tweet) {
            self.tweet.didLike = true
        }
    }
}
