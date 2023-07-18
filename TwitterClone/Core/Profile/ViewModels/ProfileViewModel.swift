//
//  ProfileViewModel.swift
//  TwitterClone
//
//  Created by MEI on 17.07.2023.
//

import Foundation

class ProfileViewModel : ObservableObject {
    @Published var tweets = [Tweet]()
    private let service = TweetService()
    let user: User
    
    init(user: User) {
        self.user = user
        guard let uid = user.id else { return }
        self.fetchUserTweets(uid: uid)
    }
    
    func fetchUserTweets(uid: String) {
        service.fetchTweets(forUid: uid) {tweets in
            self.tweets = tweets
            for i in 0 ..< tweets.count {
                self.tweets[i].user = self.user
            }
        }
    }
}
