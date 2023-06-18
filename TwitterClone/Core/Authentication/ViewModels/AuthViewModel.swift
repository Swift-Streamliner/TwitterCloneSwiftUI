//
//  AuthViewModel.swift
//  TwitterClone
//
//  Created by MEI on 18.06.2023.
//

import Firebase
import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password: String) {
        
    }
    
    func register(withEmail email: String, passsword: String, fullname: String, username: String) {
        
    }
}
