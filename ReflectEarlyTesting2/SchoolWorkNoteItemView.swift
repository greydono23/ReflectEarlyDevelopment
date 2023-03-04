//
//  ViewNotesView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/1/23.
//

import SwiftUI

struct SchoolWorkNoteItemView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var noteViewModel: SchoolWorkNoteViewModel
    
    var body: some View {
        VStack {
            Text(noteViewModel.note.noteName)
            Text(noteViewModel.note.className)
            Text(noteViewModel.note.description)
            Text(noteViewModel.note.keyDetail)
            Text(noteViewModel.note.revelation)
            Text(noteViewModel.note.freeThought)
        }
        .foregroundColor(colorScheme == .dark ? .black : .white)
        .frame(width: 300, height: 600)
        .background(.mint)
        .cornerRadius(30)
        .padding()
    }
    
    init(noteViewModel: SchoolWorkNoteViewModel) {
        self.noteViewModel = noteViewModel
    }
}

struct ViewNotesView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolWorkNoteItemView(noteViewModel: SchoolWorkNoteViewModel(note: SchoolWorkNote(noteName: "test", className: "test", description: "test", keyDetail: "test", revelation: "test", freeThought: "test")))
    }
}
