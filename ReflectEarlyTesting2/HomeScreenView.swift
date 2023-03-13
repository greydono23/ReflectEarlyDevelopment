//
//  HomeScreenView.swift
//  ReflectEarlyTesting2
//
//  Created by Artemas on 2/27/23.
//


/// ---------------------------------------------------------------------------------------------------------------------------
///                                        FEATURES IN MIND
///
/// Note Forms --> Allow users to create clubs, projects, programs, employers, etc --> save to user collection, then allow users to pick from a Picker of these options, points
/// Resume --> How to get the data populating correctly, as well as the lists with broad overviews under each subtopic
/// Get general user stuff working
///
/// COPA Laws
/// Why collecting data
/// Privacy Statement (Albert-io)
/// ---------------------------------------------------------------------------------------------------------------------------

import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        NavigationView {
            ZStack {
                TabView {
                    UserView()
                        .tabItem {
                            Label("", systemImage: "house")
                        }
                    
                    ResourcesView()
                        .tabItem {
                            Label("", systemImage: "magnifyingglass")
                        }
                    
                    ChooseNoteTypeView()
                        .tabItem {
                            Label("", systemImage: "square.and.pencil")
                        }
                    
                    ResumeView()
                        .tabItem {
                            Label("", systemImage: "folder")
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

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
