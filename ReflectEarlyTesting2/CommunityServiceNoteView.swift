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
    
    var body: some View {
        Form {
            Section(header: Text("Note Name").foregroundColor(.mint)) {
                TextField("Note Name", text: $communityServiceViewModel.model.noteName)
            }
            Section(header: Text("Organization").foregroundColor(.mint)) {
                TextField("Organization", text: $communityServiceViewModel.model.organization)
            }
            Section(header: Text("Hours").foregroundColor(.mint)) {
                HStack {
                    Slider(value: $communityServiceViewModel.model.hours, in: 0...5, step: 0.25)
                    Text("\(communityServiceViewModel.model.hours, specifier: "%.2f")")
                        .foregroundColor(.mint)
                }
            }

            Section(header: Text("Describe Your Experience").foregroundColor(.mint)) {
                TextEditor(text: $communityServiceViewModel.model.description)
            }
            Section(header: Text("Specific Detail").foregroundColor(.mint)) {
                TextEditor(text: $communityServiceViewModel.model.keyDetail)
            }
            Section(header: Text("What Does this reveal about you?").foregroundColor(.mint)) {
                TextEditor(text: $communityServiceViewModel.model.revelation)
            }
            Section(header: Text("Write freely").foregroundColor(.mint)) {
                TextEditor(text: $communityServiceViewModel.model.freeThought)
            }

        }
        .navigationTitle("New Note")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Button(action: communityServiceViewModel.write, label: { Text("Save") })
            }
        }
    }
}

class CommunityServiceViewModel: ObservableObject {
    @Published var model = CommunityServiceModel()
    
    func write() {
        do {
            model.userId = Auth.auth().currentUser?.uid
            _ = try Firestore.firestore().collection("communityServiceReflections").addDocument(from: model)
        } catch {
            print("\(error.localizedDescription)")
        }
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

//struct CommunityServiceNoteView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommunityServiceNoteView(accountViewModel: AccountViewModel())
//    }
//}
