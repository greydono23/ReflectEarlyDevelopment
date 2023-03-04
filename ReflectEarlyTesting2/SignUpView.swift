//
//  SignUpView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 2/25/23.
//

import Firebase
import SwiftUI

struct SignUpView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject private var viewModel = ViewModel()
    
    @State private var screenWidth = UIScreen.main.bounds.width
    @State private var screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        
        NavigationView {
            ZStack {
                VStack {
                    Spacer()
                    Spacer()
                    
                    VStack {
                        Text("WELCOME")
//                            .font(.title)
                            .font(.custom("Teko-Light", size: 40)) // how to make size adaptive?
                            .padding(.bottom, 20)
                        Text("SIGN UP TO BEGIN REFLECTING ON YOUR HARD WORK!")
//                            .font(.headline)
                            .font(.custom("Teko-Light", size: 25)) // how to make size adaptive?
                            .frame(width: screenWidth/1.25)
                            .multilineTextAlignment(.center)
                    }
                    
                    Spacer()
                    Spacer()
                    
                    VStack {

                        VStack {
                            TextField("example@email.com", text: $viewModel.email)
//                                .font(.headline)
                                .font(.custom("Teko-Light", size: 25)) // how to make size adaptive?
                                .frame(width: screenWidth-50)
                            
                            Rectangle()
                                .frame(width: screenWidth-50, height: 2)
                                .foregroundStyle(viewModel.validEmail() ? .mint : .gray)
                        }
                        .padding(.bottom, 10)

                        VStack {
                            SecureField("password", text: $viewModel.password)
                                .font(.custom("Teko-Light", size: 25)) // how to make size adaptive?
//                                .font(.headline)
                                .frame(width: screenWidth-50)
                            
                            Rectangle()
                                .frame(width: screenWidth-50, height: 2)
                                .foregroundStyle(viewModel.validPassword() ? .mint : .gray)
                        }
                        .padding(.bottom, 10)

                        VStack {
                            SecureField("confirm password", text: $viewModel.confirmPassword)
                                .font(.custom("Teko-Light", size: 25)) // how to make size adaptive?
//                                .font(.headline)
                                .frame(width: screenWidth-50)
                            
                            Rectangle()
                                .frame(width: screenWidth-50, height: 2)
                                .foregroundStyle(viewModel.validConfirmPassword() ? .mint : .gray)
                        }
                        .padding(.bottom, 10)
                    }
                    
                    Spacer()
                    
                   
                    Button {
                        if viewModel.validSignUp() {
                            viewModel.userSignUp()
                        }
                    } label: {
                        Text("BEGIN")
//                            .font(.title2)
                            .font(.custom("Teko-Light", size: 30)) // how to make size adaptive?
                            .bold()
                            .foregroundColor(colorScheme == .dark ? .black : .white)
                            .frame(width: screenWidth/2, height: 50)
                            .background(.mint)
                            .cornerRadius(20)
                    }
                    
                }
                
            }
            
        }
        
    }
    
    
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
