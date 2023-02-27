//
//  AuthenticationService.swift
//  ReflectEarlyTesting2
//
//  Created by Artemas on 2/27/23.
//

import Foundation
import Firebase

class AuthenticationService: ObservableObject {
    static let authenticationService: AuthenticationService = AuthenticationService()
    @Published var isAuthenticated: Bool = false
    
    func setup() {
        let _ = Auth.auth().addStateDidChangeListener { auth, user in
            self.isAuthenticated = user != nil
        }
    }
}
