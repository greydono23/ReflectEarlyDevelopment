//
//  AccountViewModel.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/2/23.
//

import Combine
import Foundation

class AccountViewModel: ObservableObject {
    
    @Published var schoolWorkNoteViewModels: [SchoolWorkNoteViewModel] = []
    
    private var cancellables: Set<AnyCancellable> = []

    @Published var noteRepository = SchoolWorkRepository()
    
    init() {
        noteRepository.$schoolWorkNotes.map { notes in
            notes.map(SchoolWorkNoteViewModel.init)
        }
        .assign(to: \.schoolWorkNoteViewModels, on: self)
        .store(in: &cancellables)
    }
    
    func add(_ note: SchoolWorkNote) {
        noteRepository.add(note)
    }
}
