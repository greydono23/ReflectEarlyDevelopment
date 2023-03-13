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
            Section(header: Text("Activity")) {
                TextField("Activity", text: $generalNoteViewModel.model.activity)
            }
            Section(header: Text("Note Name")) {
                TextField("Note Name", text: $generalNoteViewModel.model.noteName)
            }
            Section(header: Text("Hours")) {
                HStack {
                    Slider(value: $generalNoteViewModel.model.hours, in: 0...5, step: 0.25)
                        .tint(.mint)
                    Text("\(generalNoteViewModel.model.hours, specifier: "%.2f")")
                }
            }
            Section(header: Text("Describe Your Experience")) {
                TextEditor(text: $generalNoteViewModel.model.description)
            }
            Section(header: Text("Specific Detail")) {
                TextEditor(text: $generalNoteViewModel.model.keyDetail)
            }
            Section(header: Text("What Does this reveal about you?")) {
                TextEditor(text: $generalNoteViewModel.model.revelation)
            }
            Section(header: Text("Write freely")) {
                TextEditor(text: $generalNoteViewModel.model.freeThought)
            }

        }
        .font(.custom("Outfit-Light", size: 15))
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Button(action: generalNoteViewModel.write, label: { Text("SAVE").font(.custom("Outfit-Bold", size: 17)).foregroundColor(.mint) })
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
