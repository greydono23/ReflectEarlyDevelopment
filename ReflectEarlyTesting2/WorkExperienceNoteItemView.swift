//
//  WorkExperienceNoteItemView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/5/23.
//

import SwiftUI

struct WorkExperienceNoteItemView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var noteViewModel: WorkExperienceNoteViewModel
    
    var body: some View {
        VStack {
            Text(noteViewModel.note.noteName)
            Text(noteViewModel.note.employer)
            Text(noteViewModel.note.description)
            Text(noteViewModel.note.keyDetail)
            Text(noteViewModel.note.revelation)
            Text(noteViewModel.note.freeThought)
        }
        .foregroundColor(colorScheme == .dark ? .black : .white)
        .frame(width: 300, height: 300)
        .background(.mint)
        .cornerRadius(30)
        .padding()
    }
    
    init(noteViewModel: WorkExperienceNoteViewModel) {
        self.noteViewModel = noteViewModel
    }
}
