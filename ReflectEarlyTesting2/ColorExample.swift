//
//  ColorExample.swift
//  ReflectEarlyTesting2
//
//  Created by Artemas on 2/27/23.
//

import SwiftUI
import Firebase

struct ColorExample: View {
    @ObservedObject private var authenticationService = AuthenticationService.authenticationService
    
    var body: some View {
        Group {
            if authenticationService.isAuthenticated {
                Color.green
            } else {
                Color.red
            }
        }
    }
}
