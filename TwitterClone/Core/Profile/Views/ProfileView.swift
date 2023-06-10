//
//  ProfileView.swift
//  TwitterClone
//
//  Created by MEI on 08.06.2023.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(alignment: .leading) {
            headerView
            actionButtons
            userInfoDetails
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

extension ProfileView  {
    var headerView : some View {
        ZStack (alignment: .bottomLeading) {
            Color(.systemBlue).ignoresSafeArea()
            VStack {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x:16, y: 12)
                })
                Circle()
                    .frame(width: 72, height: 72)
                    .offset(x:16, y: 24)
            }
        }
        .frame(height: 96)
    }
    
    var actionButtons: some View {
        HStack (spacing: 12) {
            Spacer()
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray, lineWidth: 0.75))
            
            Button {
                
            } label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .bold()
                    .frame(width: 120, height: 32)
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
            }
        }
        .padding(.trailing)
    }
    
    var userInfoDetails: some View {
        VStack (alignment: .leading, spacing: 4) {
            HStack {
                Text("Heath Ledger")
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(Color(.systemBlue))
            }
            Text("@joker")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Your mums favorite villain")
                .font(.subheadline)
                .padding(.vertical)
            
            HStack (spacing: 24) {
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Gotham, NY")
                }
                Spacer()
                HStack {
                    Image(systemName: "link")
                    Text("www.thejoker.com")
                }
                
            }
            .font(.caption)
            .foregroundColor(.gray)
            
            HStack (spacing: 24) {
                HStack (spacing: 4){
                    Text("807")
                        .font(.headline)
                        .bold()
                    Text("Following")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Spacer()
                HStack (spacing: 4){
                    Text("6.9M")
                        .font(.headline)
                        .bold()
                    Text("Followers")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding(.vertical)
                
            }
            
        }
        .padding(.horizontal)
    }
}
