////
////  AuthTestService.swift
////  ReflectEarlyTesting2
////
////  Created by Greydon O'Keefe on 3/2/23.
////
//
//import Firebase
//import Foundation
//
//class AuthTestService: ObservableObject {
//
//    @Published var user: User?
//    @Published var isAuthenticated: Bool = false
//
//    static let authTestService: AuthTestService = AuthTestService()
//
//    private var authenticationStateHandler: AuthStateDidChangeListenerHandle?
//
//
////    init() {
////        addListeners()
////    }
////
//    func addListeners() {
//        if let handle = authenticationStateHandler {
//            Auth.auth().removeStateDidChangeListener(handle)
//        }
//
//        authenticationStateHandler = Auth.auth()
//            .addStateDidChangeListener { _, user in
//                self.isAuthenticated = user != nil
//                self.user = user
//            }
//    }
//
//    func setup() {
//        let _ = Auth.auth().addStateDidChangeListener { auth, user in
//            self.isAuthenticated = user != nil
//        }
//    }
//}
