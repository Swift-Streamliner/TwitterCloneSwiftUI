//
//  UserService.swift
//  TwitterClone
//
//  Created by MEI on 28.06.2023.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

struct UserService {
    
    func fetchUser(withUid uid: String) {
        print("DBG: Fetch User Info")
        Firestore.firestore()
            .collection("users")
            .document(uid)
            .getDocument() { snapshot, error in
                guard let snapshot = snapshot else { return }
                
                guard let user = User(snapshot: snapshot) else { return }
                
                print("DBG: user username is \(user.username)")
                print("DBG: user email is \(user.email)")
            }
    }
}
