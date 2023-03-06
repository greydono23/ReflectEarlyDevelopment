//
//  CommunityServiceNoteViewModel.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/4/23.
//

import Combine
import Foundation

class CommunityServiceNoteViewModel: ObservableObject, Identifiable {
    
    private let noteRepository = CommunityServiceRepository()
    @Published var note: CommunityServiceNote
    
    private var cancellables: Set<AnyCancellable> = []
    
    var id = ""
    
    init(note: CommunityServiceNote) {
        self.note = note
        
        $note
            .compactMap { $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
    
}
