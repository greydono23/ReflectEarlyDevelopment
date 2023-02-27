//
//  SettingsView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 2/25/23.
//

import Firebase
import SwiftUI

struct SettingsView: View {
    
    @Binding var userIsLoggedIn: Bool
    @Binding var darkMode: Bool
    
    @State private var parentsVisibility = true
    @State private var counselorsVisibility = true
    @State private var showNewParent = false
    
    var body: some View {
        Form {
//            Section(header: Text("Guardians")) {
//                HStack {
//                    Text("Mary Smith")
//                    Spacer()
//                    Text("Parent 1")
//                        .font(.caption2)
//                }
//                Button(action: {
//                    // add parent function
//                }, label: {
//                    Text("Add Parent")
//                })
//                Toggle("Can View", isOn: $parentsVisibility)
//            }
//
//            Section(header: Text("Counselors")) {
//                HStack {
//                    Text("Joseph Hopkins")
//                    Spacer()
//                    Text("Counselor 1")
//                        .font(.caption2)
//                }
//                Button(action: {
//                    // add parent function
//                }, label: {
//                    Text("Add Counselor")
//                })
//                Toggle("Can View", isOn: $counselorsVisibility)
//            }
            
            Section(header: Text("Appearance")) {
                Toggle("Dark Mode", isOn: $darkMode)
            }
            
            Section {
                Button(role: .destructive) {
                    userLogOut()
                } label: {
                    Text("Log Out as [User Name]")
                }
            }
        }
        .navigationTitle("Account")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func userLogOut() {
        do {
            try Auth.auth().signOut()
        } catch let signoutError {
            print(signoutError.localizedDescription)
            return
        }
    }

}

//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView()
//    }
//}
