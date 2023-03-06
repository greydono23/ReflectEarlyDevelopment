//
//  WorkExperienceNoteViewModel.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/5/23.
//

import Combine
import Foundation

class WorkExperienceNoteViewModel: ObservableObject, Identifiable {
    
    private let noteRepository = WorkExperienceRepository()
    @Published var note: WorkExperienceNote
    
    private var cancellables: Set<AnyCancellable> = []
    
    var id = ""
    
    init(note: WorkExperienceNote) {
        self.note = note
        
        $note
            .compactMap { $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
}
