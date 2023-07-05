//
//  UserService.swift
//  TwitterClone
//
//  Created by MEI on 28.06.2023.
//

import FirebaseFirestore
import FirebaseFirestoreSwift

struct UserService {
    
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
        print("DBG: Fetch User Info")
        Firestore.firestore()
            .collection("users")
            .document(uid)
            .getDocument() { snapshot, error in
                guard let snapshot = snapshot else { return }
                
                guard let user = User(snapshot: snapshot) else { return }
                
                completion(user)
                
                print("DBG: user username is \(user.username)")
                print("DBG: user email is \(user.email)")
            }
    }
    
    func fetchUsers(completion: @escaping([User]) -> Void) {
        var users = [User]()
        Firestore.firestore()
            .collection("users")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                documents.forEach { document in
                    guard let user = User(snapshot: snapshot) else { return }
                    users.append(user)
                }
                completion(users)
            }
    }
}
