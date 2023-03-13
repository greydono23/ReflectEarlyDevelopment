//
//  SchoolWorkNoteView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 2/28/23.
//

import Firebase
import FirebaseFirestoreSwift
import Foundation
import SwiftUI

struct SchoolWorkNoteView: View {
    @StateObject var schoolWorkViewModel = SchoolWorkViewModel()

    var body: some View {
        Form {
            Section(header: Text("Class/Club")) {
                TextField("", text: $schoolWorkViewModel.model.className)
            }
            Section(header: Text("Note Name")) {
                TextField("", text: $schoolWorkViewModel.model.noteName)
            }
            

            Section(header: Text("Describe Your Experience")) {
                TextEditor(text: $schoolWorkViewModel.model.description)
            }
            Section(header: Text("Specific Detail")) {
                TextEditor(text: $schoolWorkViewModel.model.keyDetail)
            }
            Section(header: Text("What Does this reveal about you?")) {
                TextEditor(text: $schoolWorkViewModel.model.revelation)
            }
            Section(header: Text("Write freely")) {
                TextEditor(text: $schoolWorkViewModel.model.freeThought)
            }
        }
        .font(.custom("Outfit-Light", size: 15))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Button(action: schoolWorkViewModel.write, label: { Text("SAVE").font(.custom("Outfit-Bold", size: 17)).foregroundColor(.mint) })
            }
        }
    }    
}

class SchoolWorkViewModel: ObservableObject {
    @Published var model = SchoolWorkModel()
    
    func write() {
        do {
            model.userId = Auth.auth().currentUser?.uid ?? ""
            _ = try Firestore.firestore().collection("summerProgramReflections").addDocument(from: model)
        } catch {
            print("\(error.localizedDescription)")
        }
    }
}

struct SchoolWorkModel: Identifiable, Codable {
    @DocumentID var id: String?
    var noteName: String = ""
    var className: String = ""
    var description: String = ""
    var keyDetail: String = ""
    var revelation: String = ""
    var freeThought: String = ""
    var userId: String?
}

struct SchoolWorkNoteView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolWorkNoteView()
    }
}
