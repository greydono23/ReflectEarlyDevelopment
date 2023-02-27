//
//  ReflectEarlyTesting2App.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 2/25/23.
//

import Firebase
import SwiftUI

@main
struct ReflectEarlyTesting2App: App {
    
    @State var authenticated = false
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            Group {
                if authenticated {
                    HomeScreenView()
                } else {
                    InitialLoginView()
                }
            }.onAppear() {
                let handle = Auth.auth().addStateDidChangeListener { auth, user in
                    self.authenticated = user != nil
                }
            }
        }
    }
}
