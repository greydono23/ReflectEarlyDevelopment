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
    @ObservedObject var serviceNotesViewModel = InspectServiceNotesViewModel.serviceNotesViewModel

    var body: some View {
            
        GeometryReader { geometry in
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(serviceNotesViewModel.notes) { noteModel in
                        CommunityServiceNoteItemView(note: noteModel)
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
                serviceNotesViewModel.setup()
            }
        }
        
    }
}

class InspectServiceNotesViewModel: ObservableObject {
    
    static let serviceNotesViewModel: InspectServiceNotesViewModel = InspectServiceNotesViewModel()
    
    @Published var notes: [CommunityServiceModel] = []
    
    func setup(completionHandler: (() -> Void)? = nil) {
        Firestore.firestore().collection("communityServiceReflections")
            .whereField("userId", isEqualTo: Auth.auth().currentUser!.uid)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print("Error getting notes: \(error.localizedDescription)")
                    return
                }
                
                self.notes = querySnapshot?.documents.compactMap { document in
                    try? document.data(as: CommunityServiceModel.self)
                } ?? []
                
                if let completionHandler = completionHandler {
                    completionHandler()
                }
            }
    }
    
    func getTotalCommunityServiceHours() -> Double {
        var total = 0.0
        for note in notes {
            print("hours \(note.hours)")
            total += note.hours
        }
        print("notes \(notes.count)")
        return total
    }
}


struct InpsectServiceNotesView_Previews: PreviewProvider {
    static var previews: some View {
        InpsectServiceNotesView()
    }
}
