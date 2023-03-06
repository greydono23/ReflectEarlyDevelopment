//
//  SummerProgramNoteView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/5/23.
//

import SwiftUI
import FirebaseFirestoreSwift
import Foundation
import Firebase

struct SummerProgramView: View {
    @StateObject var summerProgramViewModel = SummerProgramViewModel()
    
    var body: some View {
        Form {
            Section(header: Text("Note Name").foregroundColor(.mint)) {
                TextField("Note Name", text: $summerProgramViewModel.model.noteName)
            }
            Section(header: Text("Program").foregroundColor(.mint)) {
                TextField("Program Name", text: $summerProgramViewModel.model.programName)
            }
            Section(header: Text("Time").foregroundColor(.mint)) {
                HStack {
                    Slider(value: $summerProgramViewModel.model.hours, in: 0...5, step: 0.25)
                    Text("Hours/Day: \(summerProgramViewModel.model.hours, specifier: "%.2f")")
                        .foregroundColor(.mint)
                }
                HStack {
                    Slider(value: $summerProgramViewModel.model.weeks, in: 0...10, step: 0.5)
                    Text("Weeks: \(summerProgramViewModel.model.weeks, specifier: "%.2f")")
                        .foregroundColor(.mint)
                }
            }

            Section(header: Text("Describe Your Experience").foregroundColor(.mint)) {
                TextEditor(text: $summerProgramViewModel.model.description)
            }
            Section(header: Text("Favorite Lesson/Event").foregroundColor(.mint)) {
                TextEditor(text: $summerProgramViewModel.model.favorite)
            }
            Section(header: Text("What Does this reveal about you?").foregroundColor(.mint)) {
                TextEditor(text: $summerProgramViewModel.model.revelation)
            }
            Section(header: Text("Write freely").foregroundColor(.mint)) {
                TextEditor(text: $summerProgramViewModel.model.freeThought)
            }

        }
        .navigationTitle("New Note")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Button(action: summerProgramViewModel.write, label: {Text("Save")})
            }
        }
    }
}

class SummerProgramViewModel: ObservableObject {
    @Published var model = SummerProgramModel()
    
    func write() {
        do {
            model.userId = Auth.auth().currentUser?.uid ?? ""
            _ = try Firestore.firestore().collection("summerProgramReflections").addDocument(from: model)
        } catch {
            print("\(error.localizedDescription)")
        }
    }
}

struct SummerProgramModel: Identifiable, Codable {
    @DocumentID var id: String?
    var noteName: String = ""
    var programName: String = ""
    var hours: Double = 1.0
    var weeks: Double = 1.0
    var description: String = ""
    var favorite: String = ""
    var revelation: String = ""
    var freeThought: String = ""
    var userId: String?
}
