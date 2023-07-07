//
//  ExploreViewModel.swift
//  TwitterClone
//
//  Created by MEI on 07.07.2023.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    let service = UserService()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
            print("DBG Users \(users)")
        }
    }
}
