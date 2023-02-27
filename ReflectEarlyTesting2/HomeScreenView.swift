//
//  HomeScreenView.swift
//  ReflectEarlyTesting2
//
//  Created by Artemas on 2/27/23.
//

import SwiftUI

struct HomeScreenView: View {
    /// Uses TabView to control flow of UI once user is logged in
    var body: some View {
        NavigationView {
            ZStack {
                
                TabView {
                    UserView()
                        .tabItem {
                            Label("", systemImage: "house")
                        }
                    
                    NewNoteView()
                        .tabItem {
                            Label("", systemImage: "square.and.pencil")
                        }
                    
                    SettingsView(userIsLoggedIn: .constant(true), darkMode: .constant(true))
                        .tabItem {
                            Label("", systemImage: "person.circle")
                        }
                }
                
            }
            .ignoresSafeArea()
        }
    }
}