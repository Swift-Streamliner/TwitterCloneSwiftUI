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
    @Published var seachText = ""
    
    var searchableUsers: [User] {
        if seachText.isEmpty {
            return users
        } else {
            let lowercasedQuery = seachText.lowercased()
            
            return users.filter({
                $0.username.contains(lowercasedQuery) ||
                $0.fullname.lowercased().contains(lowercasedQuery)
            })
        }
    }
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
        }
    }
}
