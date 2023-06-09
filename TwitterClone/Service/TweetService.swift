//
//  TweetService.swift
//  TwitterClone
//
//  Created by MEI on 13.07.2023.
//

import Firebase
import FirebaseFirestore

struct TweetService {
    
    func uploadTweet(caption: String, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let data = ["uid": uid,
                    "caption": caption,
                    "likes": 0,
                    "timestamp": Timestamp(date: Date())] as [String : Any]
        
        Firestore.firestore()
            .collection("tweets")
            .document()
            .setData(data) { error in
                if let error = error {
                    print("DBG: Failed to upload tweet with error: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                completion(true)
            }
    }
    
    func fetchTweets(complition: @escaping([Tweet]) -> Void) {
        Firestore.firestore().collection("tweets").getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let tweets = documents.compactMap({Tweet(snapshot: $0)})
            complition(tweets)
        }
    }
}
