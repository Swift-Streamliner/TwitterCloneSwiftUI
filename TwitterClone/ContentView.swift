//
//  ContentView.swift
//  TwitterClone
//
//  Created by MEI on 31.05.2023.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    @State private var showMenu = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                // no user logged in
                LoginView()
            } else {
                // have a logged in user
                loggedInView
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AuthViewModel())
    }
}

extension ContentView {
    var loggedInView : some View {
        ZStack (alignment: .topLeading) {
            MainTabView()
                .navigationBarHidden(showMenu)
            
            if showMenu {
                ZStack {
                    Color.black
                        .opacity(showMenu ? 0.25 : 0.0)
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                showMenu = false
                            }
                        }
                }
                .edgesIgnoringSafeArea(.all)
            }
            
            SideMenuView()
                .frame(width: 300)
                .offset(x: showMenu ? 0 : -300, y: 0)
                .background(showMenu ? .white : .clear)
        }
        .navigationTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                if let user = viewModel.currentUser {
                    Button {
                        withAnimation(.easeInOut) {
                            showMenu.toggle()
                        }
                    } label: {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .frame(width: 32, height: 32)
                            .clipShape(Circle())
                    }
                }
            }
        }
        .onAppear {
            showMenu = false
        }
    }
}
