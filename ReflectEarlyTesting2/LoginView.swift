//
//  LoginView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 2/25/23.
//

import Firebase
import SwiftUI

struct LoginView: View {
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
                        Text("WELCOME BACK")
                            .font(.custom("Outfit-Regular", size: 30))
                            .padding(.bottom, 20)
                        Text("SIGN IN TO CONTINUE REFLECTING ON YOUR HARD WORK!")
                            .font(.custom("Outfit-Light", size: 20))
                            .frame(width: screenWidth/1.25)
                            .multilineTextAlignment(.center)
                    }
                    
                    Spacer()
                    Spacer()
                    
                    VStack {
                        VStack {
                            TextField("example@email.com", text: $viewModel.email)
                                .frame(width: screenWidth-50)
                            Rectangle()
                                .frame(width: screenWidth-50, height: 2)
                                .foregroundStyle(viewModel.validEmail() ? .mint : .gray)
                        }
                        .padding(.bottom, 10)

                        VStack {
                            SecureField("password", text: $viewModel.password)
                                .frame(width: screenWidth-50)
                            Rectangle()
                                .frame(width: screenWidth-50, height: 2)
                                .foregroundStyle(viewModel.validPassword() ? .mint : .gray)
                        }
                        .padding(.bottom, 10)
                    }
                    .font(.custom("Outfit-Regular", size: 20))

                    
                    NavigationLink {
                        // reset password screen
                    } label: {
                        Text("FORGOT PASSWORD?")
                            .font(.custom("Outfit-Regular", size: 15)) // how to make size adaptive?
                            .foregroundStyle(colorScheme == .dark ? .white : .black)
                            .padding(10)
                    }
                    
                    Spacer()
                    
                    Button {
                        if viewModel.validLogin() {
                            viewModel.userLogin()
                        }
                    } label: {
                        Text("LOGIN")
                            .font(.custom("Outfit-Medium", size: 25)) // how to make size adaptive?
                            .bold()
                            .foregroundColor(colorScheme == .dark ? .black : .white)
                            .frame(width: screenWidth/2, height: 50)
                            .background(viewModel.validLogin() ? .mint : .gray.opacity(0.3))
                            .cornerRadius(10)
                    }
                }
            }
        }
    }
    
    
}
    


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
