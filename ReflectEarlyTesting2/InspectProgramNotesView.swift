//
//  InspectProgramNotesView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/7/23.
//

import Firebase
import SwiftUI

struct InspectProgramNotesView: View {
    @ObservedObject var inspectProgramNotesViewModel = InspectProgramNotesViewModel()

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(inspectProgramNotesViewModel.notes) { noteModel in
                        SummerProgramNoteItemView(note: noteModel)
                            .frame(width: geometry.size.width*(9/10))
                            .overlay {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.purple.opacity(0.5), lineWidth: 2)
                            }
                            .padding()
                    }
                }
            }
            .onAppear() {
                inspectProgramNotesViewModel.setup()
            }
        }
    }
}

class InspectProgramNotesViewModel: ObservableObject {
    
    @Published var notes: [SummerProgramModel] = []
    
    func setup() {
        Firestore.firestore().collection("summerProgramReflections")
            .whereField("userId", isEqualTo: Auth.auth().currentUser!.uid)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print("Error getting cards: \(error.localizedDescription)")
                    return
                }
                
                self.notes = querySnapshot?.documents.compactMap { document in
                    try? document.data(as: SummerProgramModel.self)
                } ?? []
            }
    }
}

struct InspectProgramNotesView_Previews: PreviewProvider {
    static var previews: some View {
        InspectProgramNotesView()
    }
}
