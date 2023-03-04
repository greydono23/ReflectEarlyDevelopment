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
    @ObservedObject private var authenticationService = AuthenticationService.authenticationService
    
    init() {
        FirebaseApp.configure()
        AuthenticationService.authenticationService.setup()
    }
    
    var body: some Scene {        
        WindowGroup {
            if authenticationService.isAuthenticated {
                HomeScreenView()
            } else {
                InitialLoginView()
            }
        }
        
    }
}
