//
//  ContentView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 2/24/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var cvModel = ContentViewModel()
    
    @State var userIsLoggedIn = false
    @State var darkMode = true
    
    var body: some View {
        
        if userIsLoggedIn {
            HomeScreen
        } else {
            InitialLoginScreen
        }
        
    }
    
    /// Uses TabView to control flow of UI once user is logged in
    var HomeScreen: some View {
        NavigationView {
            ZStack {
                
                TabView {
                    UserView()
                        .tabItem {
                            Label("", systemImage: "house")
                        }
                    
                    NewNoteView()
                        .tabItem {
                            Label("", systemImage: "square.and.pencil")
                        }
                    
                    SettingsView(userIsLoggedIn: $userIsLoggedIn, darkMode: $darkMode)
                        .tabItem {
                            Label("", systemImage: "person.circle")
                        }
                }
                
            }
            .ignoresSafeArea()
        }
        .preferredColorScheme(darkMode ? .dark : .light)
    }
    
    /// Only to be shown once, simple view with options to sign up or login
    var InitialLoginScreen: some View {
        
        NavigationView {
            ZStack {
                VStack {
                    
                    Spacer()
                    Spacer()
                    
                    VStack {

                        Image(darkMode ? "darkModeLogo" : "lightModeLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: cvModel.screenWidth/2)
                            .padding(.bottom, 50)
                        
                        HStack {
                            Image(systemName: "graduationcap")
                                .resizable()
                                .scaledToFit()
                                .frame(width: cvModel.screenWidth/7, height: cvModel.screenWidth/7)
                                .padding(.trailing, 30)
                                .padding(.bottom, 30)
                            
                            Image(systemName: "rectangle.and.pencil.and.ellipsis")
                                .resizable()
                                .scaledToFit()
                                .frame(width: cvModel.screenWidth/7, height: cvModel.screenWidth/7)
                                .padding(.trailing, 30)
                                .padding(.bottom, 30)
                            
                            
                            Image(systemName: "clock.arrow.2.circlepath")
                                .resizable()
                                .scaledToFit()
                                .frame(width: cvModel.screenWidth/7, height: cvModel.screenWidth/7)
                                .padding(.bottom, 30)
                        }
                        .foregroundStyle(darkMode ? .white : .black)

                        
                    }
                    .padding([.top, .bottom], 30)
                    
                    Spacer()
                    
                    NavigationLink {
                        SignUpView(userIsLoggedIn: $userIsLoggedIn, darkMode: $darkMode)
                    } label: {
                        Text("GET STARTED")
//                            .font(.title2)
                            .font(.custom("Teko-Light", size: 30)) // how to make size adaptive
                            .bold()
                            .foregroundStyle(darkMode ? .black : .white)
                            .frame(width: cvModel.screenWidth-40, height: 60)
                            .background(
                                Color.mint
                            )
                            .cornerRadius(20)
                    }
                    
                    NavigationLink {
                        LoginView(userIsLoggedIn: $userIsLoggedIn, darkMode: $darkMode)
                    } label: {
                        Text("I ALREADY HAVE AN ACCOUNT")
//                            .font(.title2)
                            .font(.custom("Teko-Light", size: 30)) // how to make size adaptive?
                            .bold()
                            .foregroundStyle(.mint)
                            .padding([.top, .bottom])
                            .frame(width: cvModel.screenWidth-40, height: 60)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.gray, lineWidth: 2)
                            )
                            
                    }
                                        
                }
            }
        }
        .preferredColorScheme(darkMode ? .dark : .light)
    }
    
    /// code to view custom font names
//    init() {
//        for familyName in UIFont.familyNames {
//            print(familyName)
//
//            for fontName in UIFont.fontNames(forFamilyName: familyName) {
//                print("-- \(fontName)")
//            }
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BackgroundDesign: View {
    
    var screenWidth: CGFloat
    var screenHeight: CGFloat
    
    var body: some View {
        Rectangle()
            .frame(width: 1000, height: screenHeight/17)
            .foregroundStyle(.linearGradient(colors: [.black, .blue, .teal, .green], startPoint: .bottomTrailing, endPoint: .topLeading))
            .rotationEffect(.degrees(135))
            .offset(y: -(screenHeight/3.75))
        
        Rectangle()
            .frame(width: 1000, height: screenHeight/20)
            .foregroundStyle(.linearGradient(colors: [.green, .teal, .blue, .black], startPoint: .bottomTrailing, endPoint: .topLeading))
            .foregroundStyle(.thinMaterial)
            .rotationEffect(.degrees(-140))
            .offset(y: -(screenHeight/2.75))
        
        Rectangle()
            .frame(width: 1000, height: screenHeight/7)
            .foregroundStyle(.linearGradient(colors: [.blue, .teal, .green], startPoint: .bottomTrailing, endPoint: .topLeading))
            .rotationEffect(.degrees(135))
            .offset(y: -(screenHeight/2.25))
    }
}

struct outlineTextField: ViewModifier {
    var roundedCornes: CGFloat
    var startColor: Color
    var endColor: Color
    var textColor: Color

    func body(content: Content) -> some View {
        content
            .padding()
            .cornerRadius(roundedCornes)
            .font(.custom("Open Sans", size: 20))
            .foregroundColor(textColor)
            .overlay(
                RoundedRectangle(cornerRadius: roundedCornes)
                    .stroke(
                        LinearGradient(gradient: Gradient(colors: [startColor, endColor]),startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.5)
            )
    }
}
