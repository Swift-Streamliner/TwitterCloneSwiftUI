//
//  User.swift
//  TwitterClone
//
//  Created by MEI on 28.06.2023.
//

import FirebaseFirestoreSwift
import FirebaseFirestore

struct User : Identifiable, Hashable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
    
    init(id: String, username: String, fullname: String, profileImageUrl: String, email: String) {
            self.id = id
            self.username = username
            self.fullname = fullname
            self.profileImageUrl = profileImageUrl
            self.email = email
        }
        
        init?(snapshot: DocumentSnapshot) {
            guard let data = snapshot.data() else { return nil }
            guard let username = data["username"] as? String,
                  let fullname = data["fullname"] as? String,
                  let profileImageUrl = data["profileImageUrl"] as? String,
                  let email = data["email"] as? String else {
                return nil
            }
            
            self.id = snapshot.documentID
            self.username = username
            self.fullname = fullname
            self.profileImageUrl = profileImageUrl
            self.email = email
        }
}
