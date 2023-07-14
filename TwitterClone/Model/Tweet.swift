//
//  Tweet.swift
//  TwitterClone
//
//  Created by MEI on 14.07.2023.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

struct Tweet: Identifiable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    var user: User?
    
    
    init?(snapshot: DocumentSnapshot) {
        guard let data = snapshot.data() else { return nil }
        guard let caption = data["caption"] as? String,
              let timestamp = data["timestamp"] as? Timestamp,
              let uid = data["uid"] as? String,
              let likes = data["likes"] as? Int else {
            return nil
        }
        
        self.id = snapshot.documentID
        self.caption = caption
        self.timestamp = timestamp
        self.uid = uid
        self.likes = likes
    }
}
