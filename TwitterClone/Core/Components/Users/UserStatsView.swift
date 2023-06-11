//
//  UserStatsView.swift
//  TwitterClone
//
//  Created by MEI on 11.06.2023.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack (spacing: 24) {
            HStack (spacing: 4){
                Text("807")
                    .font(.headline)
                    .bold()
                Text("Following")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            HStack (spacing: 4){
                Text("6.9M")
                    .font(.headline)
                    .bold()
                Text("Followers")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct UserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView()
    }
}
