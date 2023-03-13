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
            Section(header: Text("Program")) {
                TextField("Program Name", text: $summerProgramViewModel.model.programName)
            }
            Section(header: Text("Note Name")) {
                TextField("Note Name", text: $summerProgramViewModel.model.noteName)
            }
            Section(header: Text("Time")) {
                HStack {
                    Slider(value: $summerProgramViewModel.model.hours, in: 0...5, step: 0.25)
                        .tint(.mint)
                    Text("Hours/Day: \(summerProgramViewModel.model.hours, specifier: "%.2f")")
                        
                }
                HStack {
                    Slider(value: $summerProgramViewModel.model.weeks, in: 0...10, step: 0.5)
                        .tint(.purple)
                    Text("Weeks: \(summerProgramViewModel.model.weeks, specifier: "%.2f")")
                        
                }
            }

            Section(header: Text("Describe Your Experience")) {
                TextEditor(text: $summerProgramViewModel.model.description)
            }
            Section(header: Text("Favorite Lesson/Event")) {
                TextEditor(text: $summerProgramViewModel.model.favorite)
            }
            Section(header: Text("What Does this reveal about you?")) {
                TextEditor(text: $summerProgramViewModel.model.revelation)
            }
            Section(header: Text("Write freely")) {
                TextEditor(text: $summerProgramViewModel.model.freeThought)
            }

        }
        .font(.custom("Outfit-Light", size: 15))
        .navigationTitle("New Note")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Button(action: summerProgramViewModel.write, label: { Text("SAVE").font(.custom("Outfit-Bold", size: 17)).foregroundColor(.mint) })
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
