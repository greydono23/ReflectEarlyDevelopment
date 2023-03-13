//
//  SignUpView-ViewModel.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 2/27/23.
//

import Firebase
import Foundation

class SignUpViewModel: ObservableObject {
    
    static let signUpViewModel: SignUpViewModel = SignUpViewModel()
    
    /// SignUpView
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
    
    /// SignUpDataView
    @Published var name = ""
    @Published var grade = "9"
    @Published var schoolCode = ""
    @Published var studentId = ""
    
    func validCodes() -> Bool {
        /// check if school code is valid, and then check if student's Student ID is valid at that school, then allow user to signup
        true /// just for the moment, eventually need to implement this
    }
    
    func userSignUp() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                Firestore.firestore().collection("students").addDocument(data: ["schoolCode": self.schoolCode, "studentId": self.studentId, "name": self.name, "grade": self.grade, "points": 0, "streak": 0, "classes": [], "clubs": [], "organizations": [], "projects": [], "programs": [], "employers": []])
            }
        }
    }
}

//struct UserModel: Identifiable, Codable {
//    @DocumentID var id: String?
//    var noteName: String = ""
//    var programName: String = ""
//    var hours: Double = 1.0
//    var weeks: Double = 1.0
//    var description: String = ""
//    var favorite: String = ""
//    var revelation: String = ""
//    var freeThought: String = ""
//    var userId: String?
//}
