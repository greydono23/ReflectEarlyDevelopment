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
    
    @ObservedObject private var viewModel = SignUpViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Spacer()
                    
                    VStack {
                        Text("WELCOME")
                            .font(.custom("Outfit-Regular", size: 30))
                            .padding(.bottom, 20)
                        Text("SIGN UP TO BEGIN REFLECTING ON YOUR HARD WORK!")
                            .font(.custom("Outfit-Light", size: 20))
                            .frame(width: geometry.size.width/1.25)
                            .multilineTextAlignment(.center)
                    }
                    
                    Spacer()
                    Spacer()
                    
                    VStack {
                        
                        VStack {
                            TextField("example@email.com", text: $viewModel.email)
                                .frame(width: geometry.size.width-50)
                            
                            Rectangle()
                                .frame(width: geometry.size.width-50, height: 2)
                                .foregroundStyle(viewModel.validEmail() ? .mint : .gray)
                        }
                        .padding(.bottom, 10)
                        
                        VStack {
                            SecureField("password", text: $viewModel.password)
                                .frame(width: geometry.size.width-50)
                            
                            Rectangle()
                                .frame(width: geometry.size.width-50, height: 2)
                                .foregroundStyle(viewModel.validPassword() ? .mint : .gray)
                        }
                        .padding(.bottom, 10)
                        
                        VStack {
                            SecureField("confirm password", text: $viewModel.confirmPassword)
                                .frame(width: geometry.size.width-50)
                            
                            Rectangle()
                                .frame(width: geometry.size.width-50, height: 2)
                                .foregroundStyle(viewModel.validConfirmPassword() ? .mint : .gray)
                        }
                        .padding(.bottom, 10)
                    }
                    .font(.custom("Outfit-Regular", size: 20))
                    
                    Spacer()
                    
                    
                    NavigationLink {
                        if viewModel.validSignUp() {
                            SignUpDataView(viewModel: viewModel)
                        }
                    } label: {
                        Text("CONTINUE")
                            .font(.custom("Outfit-Medium", size: 25))
                            .foregroundColor(colorScheme == .dark ? .black : .white)
                            .frame(width: geometry.size.width/2, height: 50)
                            .background(viewModel.validSignUp() ? .mint : .gray.opacity(0.3))
                            .cornerRadius(10)
                    }
                }
                Spacer()
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
