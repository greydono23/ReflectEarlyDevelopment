//
//  LoginView-ViewModel.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 2/27/23.
//

import Firebase
import Foundation

extension LoginView {
    @MainActor class ViewModel: ObservableObject {
        
        @Published var email = ""
        @Published var password = ""
        
        func validEmail() -> Bool {
            email.contains("@") && email.contains(".")
        }
        
        func validPassword() -> Bool {
            password.count >= 8
        }
        
        func validLogin() -> Bool {
            validEmail() && validPassword()
        }
        
        func userLogin() {
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if error != nil {
                    print(error!.localizedDescription)
                }
            }
        }
    }
}
