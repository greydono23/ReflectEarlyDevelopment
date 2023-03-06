//
//  SummerProgramNoteViewModel.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/5/23.
//

import Combine
import Foundation

class SummerProgramNoteViewModel: ObservableObject, Identifiable {
    
    private let noteRepository = SummerProgramRepository()
    @Published var note: SummerProgramNote
    
    private var cancellables: Set<AnyCancellable> = []
    
    var id = ""
    
    init(note: SummerProgramNote) {
        self.note = note
        
        $note
            .compactMap { $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
}
