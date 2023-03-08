//
//  InspectGeneralNotesViewModel.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/7/23.
//

import Firebase
import SwiftUI

struct InspectGeneralNotesView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var inspectGeneralNotesViewModel = InspectGeneralNotesViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(inspectGeneralNotesViewModel.notes) { noteModel in
                    GeneralNoteItemView(note: noteModel)
                        .padding()
                }
            }
        }.onAppear(){
            inspectGeneralNotesViewModel.setup()
        }
    }
}

class InspectGeneralNotesViewModel: ObservableObject {
    
    @Published var notes: [GeneralNoteModel] = []
    
    func setup() {
        Firestore.firestore().collection("generalReflections")
            .whereField("userId", isEqualTo: Auth.auth().currentUser!.uid)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print("Error getting cards: \(error.localizedDescription)")
                    return
                }
                
                self.notes = querySnapshot?.documents.compactMap { document in
                    try? document.data(as: GeneralNoteModel.self)
                } ?? []
            }
    }
}

struct InspectGeneralNotesView_Previews: PreviewProvider {
    static var previews: some View {
        InspectGeneralNotesView()
    }
}
