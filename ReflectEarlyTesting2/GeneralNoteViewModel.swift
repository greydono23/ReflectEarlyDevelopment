//
//  GeneralNoteViewModel.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/5/23.
//

import Combine
import Foundation

class GeneralNoteViewModel: ObservableObject, Identifiable {
    
    private let noteRepository = GeneralRepository()
    @Published var note: GeneralNote
    
    private var cancellables: Set<AnyCancellable> = []
    
    var id = ""
    
    init(note: GeneralNote) {
        self.note = note
        
        $note
            .compactMap { $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
}
