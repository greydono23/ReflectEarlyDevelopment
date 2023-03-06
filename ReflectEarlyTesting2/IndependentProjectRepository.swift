//
//  IndependentProjectRepository.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/4/23.
//

import Combine
import Firebase
import FirebaseFirestoreSwift
import Foundation

class IndependentProjectRepository: ObservableObject {
        
    private let authenticationService = AuthenticationService()

    private var userId = ""
    
    @Published var independentProjectNotes: [IndependentProjectNote] = []
    
    private var cancellables: Set<AnyCancellable> = []
        
    private let path: String = "independentProjectReflections"
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
                
                self.independentProjectNotes = querySnapshot?.documents.compactMap { document in
                    try? document.data(as: IndependentProjectNote.self)
                } ?? []
            }
    }
    
    func add(_ note: IndependentProjectNote) {
        do {
            var newNote = note
            newNote.userId = userId
            _ = try store.collection(path).addDocument(from: newNote)
        } catch {
            print("\(error.localizedDescription)")
        }
    }
    
}

