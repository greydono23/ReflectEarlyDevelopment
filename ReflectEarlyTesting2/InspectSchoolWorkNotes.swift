//
//  ViewSchoolWorkNotes.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/6/23.
//

import Firebase
import SwiftUI

struct InspectSchoolNotesView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var inspectSchoolWorkNotesViewModel = InspectSchoolWorkNotesViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(inspectSchoolWorkNotesViewModel.notes) { noteModel in
                    SchoolWorkNoteItemView(note: noteModel)
                        .padding()
                }
            }
        }.onAppear(){
            inspectSchoolWorkNotesViewModel.setup()
        }
    }
}

class InspectSchoolWorkNotesViewModel: ObservableObject {
    
    @Published var notes: [SchoolWorkModel] = []
    
    func setup() {
        Firestore.firestore().collection("schoolWorkReflections")
            .whereField("userId", isEqualTo: Auth.auth().currentUser!.uid)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print("Error getting cards: \(error.localizedDescription)")
                    return
                }
                
                self.notes = querySnapshot?.documents.compactMap { document in
                    try? document.data(as: SchoolWorkModel.self)
                } ?? []
            }
    }
}

struct ViewSchoolWorkNotes_Previews: PreviewProvider {
    static var previews: some View {
        InspectSchoolNotesView()
    }
}
