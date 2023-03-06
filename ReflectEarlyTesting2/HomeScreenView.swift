//
//  HomeScreenView.swift
//  ReflectEarlyTesting2
//
//  Created by Artemas on 2/27/23.
//

import SwiftUI

struct HomeScreenView: View {
    /// Uses TabView to control flow of UI once user is logged in
    var body: some View {
        NavigationView {
            ZStack {
                TabView {
                    UserView()
                        .tabItem {
                            Label("", systemImage: "house")
                        }
                    
                    ChooseNoteTypeView()
                        .tabItem {
                            Label("", systemImage: "square.and.pencil")
                        }
                    
                    AccountView()
                        .tabItem {
                            Label("", systemImage: "person.circle")
                        }
                }
                
            }
            .ignoresSafeArea()
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
