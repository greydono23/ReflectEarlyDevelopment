//
//  IndependentProjectNoteViewModel.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/4/23.
//

import Combine
import Foundation

class IndependentProjectNoteViewModel: ObservableObject, Identifiable {
    
    private let noteRepository = IndependentProjectRepository()
    @Published var note: IndependentProjectNote
    
    private var cancellables: Set<AnyCancellable> = []
    
    var id = ""
    
    init(note: IndependentProjectNote) {
        self.note = note
        
        $note
            .compactMap { $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
}
