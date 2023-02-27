//
//  LoginView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 2/25/23.
//

import Firebase
import SwiftUI

struct LoginView: View {
    
    @Binding var userIsLoggedIn: Bool
    @Binding var darkMode: Bool
    
    @State private var screenWidth = UIScreen.main.bounds.width
    @State private var screenHeight = UIScreen.main.bounds.height
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        
        NavigationView {
            ZStack {
                VStack {
                    Spacer()
                    Spacer()
                    
                    VStack {
                        Text("WELCOME BACK")
                            .font(.custom("Teko-Light", size: 40)) // how to make size adaptive?
//                            .font(.title)
                            .padding(.bottom, 20)
                        Text("SIGN IN TO CONTINUE REFLECTING ON YOUR HARD WORK!")
                            .font(.custom("Teko-Light", size: 25)) // how to make size adaptive?
//                            .font(.headline)
                            .frame(width: screenWidth/1.25)
                            .multilineTextAlignment(.center)
                    }
                    .foregroundColor(darkMode ? .white : .black)
                    
                    Spacer()
                    Spacer()
                    
                    VStack {

                        VStack {
                            TextField("example@email.com", text: $email)
//                                .font(.headline)
                                .font(.custom("Teko-Light", size: 25)) // how to make size adaptive?
                                .frame(width: screenWidth-50)
                            
                            Rectangle()
                                .frame(width: screenWidth-50, height: 2)
                                .foregroundStyle(validEmail() ? .mint : .gray)
                        }
                        .padding(.bottom, 10)

                        VStack {
                            SecureField("password", text: $password)
                                .font(.custom("Teko-Light", size: 25)) // how to make size adaptive?
//                                .font(.headline)
                                .frame(width: screenWidth-50)
                            
                            Rectangle()
                                .frame(width: screenWidth-50, height: 2)
                                .foregroundStyle(validPassword() ? .mint : .gray)
                        }
                        .padding(.bottom, 10)
                    }
                    
                    NavigationLink {
                        // reset password screen
                    } label: {
                        Text("FORGOT PASSWORD?")
                            .font(.custom("Teko-Light", size: 25)) // how to make size adaptive?
                            .foregroundColor(darkMode ? .white : .black)
                            .padding([.top, .bottom], 10)
                    }
                    
                    Spacer()
                    
                    Button {
                        if validEmail() && validPassword() {
                            userLogin()
                        }
                    } label: {
                        Text("LOGIN")
//                            .font(.title2)
                            .font(.custom("Teko-Light", size: 30)) // how to make size adaptive?
                            .bold()
                            .foregroundColor(darkMode ? .black : .white)
                            .frame(width: screenWidth/2, height: 50)
                            .background(.mint)
                            .cornerRadius(20)
                    }
                }
            }
            .preferredColorScheme(darkMode ? .dark : .light)
        }
    }
    
    func validEmail() -> Bool {
        email.contains("@") && email.contains(".")
    }
    
    func validPassword() -> Bool {
        password.count >= 8
    }
    
    func userLogin() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
                userIsLoggedIn = false
                return
            }
        }
        userIsLoggedIn = true
    }
}
    


struct LoginView_Previews: PreviewProvider {
    private var bool = false
    static var previews: some View {
        LoginView(userIsLoggedIn: .constant(true), darkMode: .constant(true))
    }
}
