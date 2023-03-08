//
//  InpsectServiceNotesView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/7/23.
//

import Firebase
import SwiftUI

struct InpsectServiceNotesView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var inspectServiceNotesViewModel = InspectServiceNotesViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(inspectServiceNotesViewModel.notes) { noteModel in
                    CommunityServiceNoteItemView(note: noteModel)
                        .padding()
                }
            }
        }.onAppear(){
            inspectServiceNotesViewModel.setup()
        }
    }
}

class InspectServiceNotesViewModel: ObservableObject {
    
    @Published var notes: [CommunityServiceModel] = []
    
    func setup() {
        Firestore.firestore().collection("communityServiceReflections")
            .whereField("userId", isEqualTo: Auth.auth().currentUser!.uid)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print("Error getting cards: \(error.localizedDescription)")
                    return
                }
                
                self.notes = querySnapshot?.documents.compactMap { document in
                    try? document.data(as: CommunityServiceModel.self)
                } ?? []
            }
    }
}


struct InpsectServiceNotesView_Previews: PreviewProvider {
    static var previews: some View {
        InpsectServiceNotesView()
    }
}
