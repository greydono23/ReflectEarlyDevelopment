//
//  GeneralNoteView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/5/23.
//

import Firebase
import FirebaseFirestoreSwift
import Foundation
import SwiftUI

struct GeneralNoteView: View {
    @StateObject var generalNoteViewModel = GeneralNoteViewModel()
    
    var body: some View {
        Form {
            Section(header: Text("Note Name").foregroundColor(.mint)) {
                TextField("Note Name", text: $generalNoteViewModel.model.noteName)
            }
            Section(header: Text("Organization").foregroundColor(.mint)) {
                TextField("Organization", text: $generalNoteViewModel.model.activity)
            }
            Section(header: Text("Hours").foregroundColor(.mint)) {
                HStack {
                    Slider(value: $generalNoteViewModel.model.hours, in: 0...5, step: 0.25)
                    Text("\(generalNoteViewModel.model.hours, specifier: "%.2f")")
                        .foregroundColor(.mint)
                }
            }
            Section(header: Text("Describe Your Experience").foregroundColor(.mint)) {
                TextEditor(text: $generalNoteViewModel.model.description)
            }
            Section(header: Text("Specific Detail").foregroundColor(.mint)) {
                TextEditor(text: $generalNoteViewModel.model.keyDetail)
            }
            Section(header: Text("What Does this reveal about you?").foregroundColor(.mint)) {
                TextEditor(text: $generalNoteViewModel.model.revelation)
            }
            Section(header: Text("Write freely").foregroundColor(.mint)) {
                TextEditor(text: $generalNoteViewModel.model.freeThought)
            }

        }
        .navigationTitle("New Note")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Button(action: generalNoteViewModel.write, label: { Text("Save") })
            }
        }
    }
}

class GeneralNoteViewModel: ObservableObject {
    @Published var model = GeneralNoteModel()
    
    func write() {
        do {
            model.userId = Auth.auth().currentUser?.uid ?? ""
            _ = try Firestore.firestore().collection("generalReflections").addDocument(from: model)
        } catch {
            print("\(error.localizedDescription)")
        }
    }
}

struct GeneralNoteModel: Identifiable, Codable {
    @DocumentID var id: String?
    var noteName: String = ""
    var activity: String = ""
    var hours: Double = 1.0
    var description: String = ""
    var keyDetail: String = ""
    var revelation: String = ""
    var freeThought: String = ""
    var userId: String?
}

//struct GeneralNoteView_Previews: PreviewProvider {
//    static var previews: some View {
//        GeneralNoteView(accountViewModel: AccountViewModel())
//    }
//}
