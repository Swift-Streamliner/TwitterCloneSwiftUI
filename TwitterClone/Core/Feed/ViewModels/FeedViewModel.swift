//
//  FeedViewModel.swift
//  TwitterClone
//
//  Created by MEI on 14.07.2023.
//

import Foundation

class FeedViewModel : ObservableObject {
    
    @Published var tweets = [Tweet]()
    
    let service = TweetService()
    
    init() {
        fetchTweets()
    }
    
    func fetchTweets() {
        service.fetchTweets {tweets in
            self.tweets = tweets
        }
    }
}
