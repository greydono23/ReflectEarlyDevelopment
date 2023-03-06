//
//  SummerProgramRepository.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/5/23.
//

import Combine
import Firebase
import FirebaseFirestoreSwift
import Foundation

class SummerProgramRepository: ObservableObject {
    
    private let authenticationService = AuthenticationService()

    private var userId = ""
    
    @Published var summerProgramNotes: [SummerProgramNote] = []
    
    private var cancellables: Set<AnyCancellable> = []
        
    private let path: String = "summerProgramReflections"
    private let store = Firestore.firestore()
    
    init() {
        self.userId = Auth.auth().currentUser?.uid ?? ""
        
        authenticationService.$user
            .compactMap { user in
                user?.uid
            }
            .assign(to: \.userId, on: self)
            .store(in: &cancellables)
        
        authenticationService.$user
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.get()
            }
            .store(in: &cancellables)
    }
    
    func get() {
        store.collection(path)
            .whereField("userId", isEqualTo: userId)
            .addSnapshotListener { querySnapshot, error in
                if let error = error {
                    print("Error getting cards: \(error.localizedDescription)")
                    return
                }
                
                self.summerProgramNotes = querySnapshot?.documents.compactMap { document in
                    try? document.data(as: SummerProgramNote.self)
                } ?? []
            }
    }
    
    func add(_ note: SummerProgramNote) {
        do {
            var newNote = note
            newNote.userId = userId
            _ = try store.collection(path).addDocument(from: newNote)
        } catch {
            print("\(error.localizedDescription)")
        }
    }
}
