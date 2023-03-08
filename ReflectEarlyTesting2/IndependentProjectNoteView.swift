//
//  IndependentProjectNoteView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/4/23.
//

import Firebase
import FirebaseFirestoreSwift
import Foundation
import SwiftUI

struct IndependentProjectNoteView: View {
    @StateObject var independentProjectViewModel = IndependentProjectViewModel()
    
    var body: some View {
        Form {
            Section(header: Text("Note Name").foregroundColor(.mint)) {
                TextField("Note Name", text: $independentProjectViewModel.model.noteName)
            }
            Section(header: Text("Project").foregroundColor(.mint)) {
                TextField("Project Name", text: $independentProjectViewModel.model.projectName)
            }
            Section(header: Text("Hours").foregroundColor(.mint)) {
                HStack {
                    Slider(value: $independentProjectViewModel.model.hours, in: 0...5, step: 0.25)
                    Text("\(independentProjectViewModel.model.hours, specifier: "%.2f")")
                        .foregroundColor(.mint)
                }
            }

            Section(header: Text("Describe Your Experience").foregroundColor(.mint)) {
                TextEditor(text: $independentProjectViewModel.model.description)
            }
            Section(header: Text("Specific Detail").foregroundColor(.mint)) {
                TextEditor(text: $independentProjectViewModel.model.keyDetail)
            }
            Section(header: Text("What Does this reveal about you?").foregroundColor(.mint)) {
                TextEditor(text: $independentProjectViewModel.model.revelation)
            }
            Section(header: Text("Write freely").foregroundColor(.mint)) {
                TextEditor(text: $independentProjectViewModel.model.freeThought)
            }
        }
        .navigationTitle("New Note")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Button(action: independentProjectViewModel.write, label: { Text("Save") })
            }
        }
    }
}

class IndependentProjectViewModel: ObservableObject {
    @Published var model = IndependentProjectModel()
    
    func write() {
        do {
            model.userId = Auth.auth().currentUser?.uid ?? ""
            _ = try Firestore.firestore().collection("independentProjectReflections").addDocument(from: model)
        } catch {
            print("\(error.localizedDescription)")
        }
    }
}

struct IndependentProjectModel: Identifiable, Codable {
    @DocumentID var id: String?
    var noteName: String = ""
    var projectName: String = ""
    var hours: Double = 1.0
    var description: String = ""
    var keyDetail: String = ""
    var revelation: String = ""
    var freeThought: String = ""
    var userId: String?
}

//struct IndependentProjectNoteView_Previews: PreviewProvider {
//    static var previews: some View {
//        IndependentProjectNoteView(accountViewModel: AccountViewModel())
//    }
//}
