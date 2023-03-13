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
            Section(header: Text("Employer")) {
                TextField("Class/Club Name", text: $workExperienceViewModel.model.employer)
            }
            Section(header: Text("Note Name")) {
                TextField("Note Name", text: $workExperienceViewModel.model.noteName)
            }
            Section(header: Text("Time")) {
                HStack {
                    Slider(value: $workExperienceViewModel.model.hours, in: 0...5, step: 0.25)
                        .tint(.mint)
                    Text("Hours/Day: \(workExperienceViewModel.model.hours, specifier: "%.2f")")
                        
                }
                HStack {
                    Slider(value: $workExperienceViewModel.model.weeks, in: 0...10, step: 0.5)
                        .tint(.purple)
                    Text("Weeks: \(workExperienceViewModel.model.weeks, specifier: "%.2f")")
                        
                }
            }
            Section(header: Text("Describe Your Experience")) {
                TextEditor(text: $workExperienceViewModel.model.description)
            }
            Section(header: Text("Specific Detail")) {
                TextEditor(text: $workExperienceViewModel.model.keyDetail)
            }
            Section(header: Text("What Does this reveal about you?")) {
                TextEditor(text: $workExperienceViewModel.model.revelation)
            }
            Section(header: Text("Write freely")) {
                TextEditor(text: $workExperienceViewModel.model.freeThought)
            }

        }
        .font(.custom("Outfit-Light", size: 15))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Button(action: workExperienceViewModel.write, label: { Text("SAVE").font(.custom("Outfit-Bold", size: 17)).foregroundColor(.mint) })
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
