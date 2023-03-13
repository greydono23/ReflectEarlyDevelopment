//
//  InspectWorkExperienceNotesView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/7/23.
//

import Firebase
import SwiftUI

struct InspectWorkExperienceNotesView: View {
    @ObservedObject var inspectWorkExperienceNotesViewModel = InspectWorkNotesViewModel()

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(inspectWorkExperienceNotesViewModel.notes) { noteModel in
                        WorkExperienceNoteItemView(note: noteModel)
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
                inspectWorkExperienceNotesViewModel.setup()
            }
        }
    }
}

class InspectWorkNotesViewModel: ObservableObject {
    
    @Published var notes: [WorkExperienceModel] = []
    
    func setup() {
        Firestore.firestore().collection("workExperienceReflections")
            .whereField("userId", isEqualTo: Auth.auth().currentUser!.uid)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print("Error getting cards: \(error.localizedDescription)")
                    return
                }
                
                self.notes = querySnapshot?.documents.compactMap { document in
                    try? document.data(as: WorkExperienceModel.self)
                } ?? []
            }
    }
}

struct InspectWorkExperienceNotesView_Previews: PreviewProvider {
    static var previews: some View {
        InspectWorkExperienceNotesView()
    }
}
