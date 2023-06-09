//
//  AuthViewModel.swift
//  TwitterClone
//
//  Created by MEI on 18.06.2023.
//

import Firebase
import FirebaseFirestore
import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var tempUserSession: FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    @Published var currentUser: User?
    
    private let service = UserService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to login with errro \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else {
                return
            }
            self.userSession = user
            self.fetchUser()
        }
    }
    
    func register(withEmail email: String, passsword: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: passsword) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            
            self.tempUserSession = user
            
            let data = [
                "email" : email,
                "username" : username.lowercased(),
                "fullname" : fullname,
                "uid" : user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    print("DEBUG: Did upload user data...")
                    self.didAuthenticateUser = true
                }
        }
    }
    
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempUserSession?.uid else { return }
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl" : profileImageUrl]) { _ in
                    self.userSession = self.tempUserSession
                    self.fetchUser()
                }
        }
    }
    
    func fetchUser() {
        guard let uid = self.userSession?.uid else { return }
        
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
        }
    }
}
