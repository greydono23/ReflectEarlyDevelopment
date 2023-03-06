//
//  WorkExperienceRepository.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/5/23.
//

import Combine
import Firebase
import FirebaseFirestoreSwift
import Foundation

class WorkExperienceRepository: ObservableObject {
    
    private let authenticationService = AuthenticationService()

    private var userId = ""
    
    @Published var workExperienceNotes: [WorkExperienceNote] = []
    
    private var cancellables: Set<AnyCancellable> = []
        
    private let path: String = "workExperienceReflections"
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
                
                self.workExperienceNotes = querySnapshot?.documents.compactMap { document in
                    try? document.data(as: WorkExperienceNote.self)
                } ?? []
            }
    }
    
    func add(_ note: WorkExperienceNote) {
        do {
            var newNote = note
            newNote.userId = userId
            _ = try store.collection(path).addDocument(from: newNote)
        } catch {
            print("\(error.localizedDescription)")
        }
    }
}
