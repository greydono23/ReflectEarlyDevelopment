//
//  WorkExperienceNoteView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/5/23.
//

import Firebase
import FirebaseFirestoreSwift
import Foundation
import SwiftUI

struct WorkExperienceNoteView: View {
    @StateObject var workExperienceViewModel = WorkExperienceViewModel()
    
    var body: some View {
        Form {
            Section(header: Text("Note Name").foregroundColor(.mint)) {
                TextField("Note Name", text: $workExperienceViewModel.model.noteName)
            }
            Section(header: Text("Employer").foregroundColor(.mint)) {
                TextField("Class/Club Name", text: $workExperienceViewModel.model.employer)
            }
            Section(header: Text("Time").foregroundColor(.mint)) {
                HStack {
                    Slider(value: $workExperienceViewModel.model.hours, in: 0...5, step: 0.25)
                    Text("Hours/Day: \(workExperienceViewModel.model.hours, specifier: "%.2f")")
                        .foregroundColor(.mint)
                }
                HStack {
                    Slider(value: $workExperienceViewModel.model.weeks, in: 0...10, step: 0.5)
                    Text("Weeks: \(workExperienceViewModel.model.weeks, specifier: "%.2f")")
                        .foregroundColor(.mint)
                }
            }
            Section(header: Text("Describe Your Experience").foregroundColor(.mint)) {
                TextEditor(text: $workExperienceViewModel.model.description)
            }
            Section(header: Text("Specific Detail").foregroundColor(.mint)) {
                TextEditor(text: $workExperienceViewModel.model.keyDetail)
            }
            Section(header: Text("What Does this reveal about you?").foregroundColor(.mint)) {
                TextEditor(text: $workExperienceViewModel.model.revelation)
            }
            Section(header: Text("Write freely").foregroundColor(.mint)) {
                TextEditor(text: $workExperienceViewModel.model.freeThought)
            }

        }
        .navigationTitle("New Note")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Button(action: workExperienceViewModel.write, label: { Text("Save") })
            }
        }
    }
}

class WorkExperienceViewModel: ObservableObject {
    @Published var model = WorkExperienceModel()
    
    func write() {
        do {
            model.userId = Auth.auth().currentUser?.uid ?? ""
            _ = try Firestore.firestore().collection("workExperienceReflections").addDocument(from: model)
        } catch {
            print("\(error.localizedDescription)")
        }
    }
}

struct WorkExperienceModel: Identifiable, Codable {
    @DocumentID var id: String?
    var noteName: String = ""
    var employer: String = ""
    var hours: Double = 1.0
    var weeks: Double = 1.0
    var description: String = ""
    var keyDetail: String = ""
    var revelation: String = ""
    var freeThought: String = ""
    var userId: String?
}
//struct WorkExperienceNoteView_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkExperienceNoteView(accountViewModel: AccountViewModel())
//    }
//}
