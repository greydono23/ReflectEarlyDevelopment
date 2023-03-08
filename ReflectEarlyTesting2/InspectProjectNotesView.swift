//
//  InspectProjectNotesView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/7/23.
//

import Firebase
import SwiftUI

struct InspectProjectNotesView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var inspectProjectNotesViewModel = InspectProjectNotesViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(inspectProjectNotesViewModel.notes) { noteModel in
                    IndependentProjectNoteItemView(note: noteModel)
                        .padding()
                }
            }
        }.onAppear(){
            inspectProjectNotesViewModel.setup()
        }
    }
}

class InspectProjectNotesViewModel: ObservableObject {
    
    @Published var notes: [IndependentProjectModel] = []
    
    func setup() {
        Firestore.firestore().collection("independentProjectReflections")
            .whereField("userId", isEqualTo: Auth.auth().currentUser!.uid)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print("Error getting cards: \(error.localizedDescription)")
                    return
                }
                
                self.notes = querySnapshot?.documents.compactMap { document in
                    try? document.data(as: IndependentProjectModel.self)
                } ?? []
            }
    }
}

struct InspectProjectNotesView_Previews: PreviewProvider {
    static var previews: some View {
        InspectProjectNotesView()
    }
}
