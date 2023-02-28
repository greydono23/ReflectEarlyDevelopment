//
//  InitialLoginView.swift
//  ReflectEarlyTesting2
//
//  Created by Artemas on 2/27/23.
//

import SwiftUI

struct InitialLoginView: View {
    /// Only to be shown once, simple view with options to sign up or login
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    
                    Spacer()
                    Spacer()
                    
                    VStack {
                        
                        Image(true ? "darkModeLogo" : "lightModeLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width/2)
                            .padding(.bottom, 50)
                        
                        HStack {
                            Image(systemName: "graduationcap")
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.width/7, height: UIScreen.main.bounds.width/7)
                                .padding(.trailing, 30)
                                .padding(.bottom, 30)
                            
                            Image(systemName: "rectangle.and.pencil.and.ellipsis")
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.width/7, height: UIScreen.main.bounds.width/7)
                                .padding(.trailing, 30)
                                .padding(.bottom, 30)
                            
                            
                            Image(systemName: "clock.arrow.2.circlepath")
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.width/7, height: UIScreen.main.bounds.width/7)
                                .padding(.bottom, 30)
                        }
                        .foregroundStyle(true ? .white : .black)
                        
                        
                    }
                    .padding([.top, .bottom], 30)
                    
                    Spacer()
                    
                    NavigationLink {
                        SignUpView(userIsLoggedIn: .constant(false), darkMode: .constant(true))
                    } label: {
                        Text("GET STARTED")
                        //                            .font(.title2)
                            .font(.custom("Teko-Light", size: 30)) // how to make size adaptive
                            .bold()
                            .foregroundStyle(true ? .black : .white)
                            .frame(width: UIScreen.main.bounds.width-40, height: 60)
                            .background(
                                Color.mint
                            )
                            .cornerRadius(20)
                    }
                    
                    NavigationLink {
                        LoginView(userIsLoggedIn: .constant(false), darkMode: .constant(true))
                    } label: {
                        Text("I ALREADY HAVE AN ACCOUNT")
                        //                            .font(.title2)
                            .font(.custom("Teko-Light", size: 30)) // how to make size adaptive?
                            .bold()
                            .foregroundStyle(.mint)
                            .padding([.top, .bottom])
                            .frame(width: UIScreen.main.bounds.width-40, height: 60)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.gray, lineWidth: 2)
                            )
                        
                    }
                    
                }
            }
        }
    }
}
