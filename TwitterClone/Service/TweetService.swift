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
}
