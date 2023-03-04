//
//  ViewNotesViewRepository.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/1/23.
//

import Combine
import Foundation

class SchoolWorkNoteItemViewModel: ObservableObject, Identifiable {
    
    private let noteRepository = SchoolWorkRepository()
    @Published var note: SchoolWorkNote

    private var cancellables: Set<AnyCancellable> = []
    
    var id = ""
    
    init(note: SchoolWorkNote) {
        self.note = note
        
        $note
            .compactMap { $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
    
    func add(_ note: SchoolWorkNote) {
        noteRepository.add(note)
    }
    
}
