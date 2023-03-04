//
//  AuthenticationService.swift
//  ReflectEarlyTesting2
//
//  Created by Artemas on 2/27/23.
//

import Firebase
import Foundation

class AuthenticationService: ObservableObject {
    
    @Published var user: User?
    @Published var userId = ""
    
    static let authenticationService: AuthenticationService = AuthenticationService()
    
    @Published var isAuthenticated: Bool = false
        
    func setup() {
        let _ = Auth.auth().addStateDidChangeListener { auth, user in
            self.isAuthenticated = user != nil
            self.user = user
            guard let userID = Auth.auth().currentUser?.uid else { return }
            self.userId = userID
        }
    }
}
