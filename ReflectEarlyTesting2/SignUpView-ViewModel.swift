//
//  SignUpView-ViewModel.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 2/27/23.
//

import Firebase
import Foundation

extension SignUpView {
    @MainActor class ViewModel: ObservableObject {
        
        @Published var email = ""
        @Published var password = ""
        @Published var confirmPassword = ""
        
        func validEmail() -> Bool {
            email.contains("@") && email.contains(".")
        }
        
        func validPassword() -> Bool {
            password.count >= 8
        }
        
        func validConfirmPassword() -> Bool {
            validPassword() && password == confirmPassword
        }
        
        func validSignUp() -> Bool {
            validEmail() && validPassword() && validConfirmPassword()
        }
        
        func userSignUp() {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if error != nil {
                    print(error!.localizedDescription)
                }
            }
        }
    }
    
}
