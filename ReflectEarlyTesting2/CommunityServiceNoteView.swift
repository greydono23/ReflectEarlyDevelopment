//
//  CommunityServiceNoteView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/4/23.
//

import Firebase
import FirebaseFirestoreSwift
import Foundation
import SwiftUI

struct CommunityServiceNoteView: View {
    @StateObject var communityServiceViewModel = CommunityServiceViewModel()
    
    @State private var presentNewOrganizationForm = false
    
    var body: some View {
        Form {
            Section(header: Text("New Organization")) {
                TextField("", text: $communityServiceViewModel.model.organization)
                Button(action: {
                    presentNewOrganizationForm = true
                }, label: {
                    HStack {
                        Spacer();
                        Text("Add Organization")
                            .font(.custom("Outfit-Semibold", size: 15))
                            .foregroundColor(.mint)
                        Spacer()}
                    
                })
                .alert("Login", isPresented: $presentNewOrganizationForm, actions: {
                    TextField("New Organization", text: $communityServiceViewModel.newOrganization)
                    
                    Button("Create", action: { })
                    Button("Cancel", role: .cancel, action: { communityServiceViewModel.newOrganization = "" })
                        .tint(.red)
                }, message: {
                    Text("Type the name of the new organization")
                })
                
            }
            Section(header: Text("Note Name")) {
                TextField("", text: $communityServiceViewModel.model.noteName)
            }
            Section(header: Text("Hours")) {
                HStack {
                    Slider(value: $communityServiceViewModel.model.hours, in: 0...5, step: 0.25)
                        .tint(.mint)
                    Text("\(communityServiceViewModel.model.hours, specifier: "%.2f")")
                }
            }

            Section(header: Text("Describe Your Experience")) {
                TextEditor(text: $communityServiceViewModel.model.description)
            }
            Section(header: Text("Specific Detail")) {
                TextEditor(text: $communityServiceViewModel.model.keyDetail)
            }
            Section(header: Text("What Does this reveal about you?")) {
                TextEditor(text: $communityServiceViewModel.model.revelation)
            }
            Section(header: Text("Write freely")) {
                TextEditor(text: $communityServiceViewModel.model.freeThought)
            }

        }
        .font(.custom("Outfit-Light", size: 15))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Button(action: communityServiceViewModel.write, label: { Text("SAVE").font(.custom("Outfit-Bold", size: 17)).foregroundColor(.mint) })
            }
        }
    }
}

/// want it to pull users organizations so they can pick from this
class CommunityServiceViewModel: ObservableObject {
    @Published var model = CommunityServiceModel()
    
    @Published var newOrganization = ""
    
    func write() {
        do {
            model.userId = Auth.auth().currentUser?.uid
            _ = try Firestore.firestore().collection("communityServiceReflections").addDocument(from: model)
        } catch {
            print("\(error.localizedDescription)")
        }
    }
     
    func addOrganization() {
        

    }
}

struct CommunityServiceModel: Identifiable, Codable {
    @DocumentID var id: String?
    var noteName: String = ""
    var organization: String = ""
    var hours: Double = 1.0
    var description: String = ""
    var keyDetail: String = ""
    var revelation: String = ""
    var freeThought: String = ""
    var userId: String?
}

struct CommunityServiceNoteView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityServiceNoteView()
    }
}
