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
            Section(header: Text("Project")) {
                TextField("Project Name", text: $independentProjectViewModel.model.projectName)
            }
            Section(header: Text("Note Name")) {
                TextField("Note Name", text: $independentProjectViewModel.model.noteName)
            }
            Section(header: Text("Hours")) {
                HStack {
                    Slider(value: $independentProjectViewModel.model.hours, in: 0...5, step: 0.25)
                        .tint(.mint)
                    Text("\(independentProjectViewModel.model.hours, specifier: "%.2f")")
                        
                }
            }

            Section(header: Text("Describe Your Experience")) {
                TextEditor(text: $independentProjectViewModel.model.description)
            }
            Section(header: Text("Specific Detail")) {
                TextEditor(text: $independentProjectViewModel.model.keyDetail)
            }
            Section(header: Text("What Does this reveal about you?")) {
                TextEditor(text: $independentProjectViewModel.model.revelation)
            }
            Section(header: Text("Write freely")) {
                TextEditor(text: $independentProjectViewModel.model.freeThought)
            }
        }
        .font(.custom("Outfit-Light", size: 15))
        .navigationTitle("New Note")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Button(action: independentProjectViewModel.write, label: { Text("SAVE").font(.custom("Outfit-Bold", size: 17)).foregroundColor(.mint) })
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

struct IndependentProjectNoteView_Previews: PreviewProvider {
    static var previews: some View {
        IndependentProjectNoteView()
    }
}
