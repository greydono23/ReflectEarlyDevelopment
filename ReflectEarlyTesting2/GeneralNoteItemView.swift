//
//  GeneralNoteItemView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/5/23.
//

import SwiftUI

struct GeneralNoteItemView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var noteViewModel: GeneralNoteViewModel
    
    var body: some View {
        VStack {
            Text(noteViewModel.note.noteName)
            Text(noteViewModel.note.activity)
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
    
    init(noteViewModel: GeneralNoteViewModel) {
        self.noteViewModel = noteViewModel
    }
}

struct GeneralNoteItemView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralNoteItemView(noteViewModel: GeneralNoteViewModel(note: GeneralNote(noteName: "test", activity: "test", hours: 3, description: "test", keyDetail: "test", revelation: "test", freeThought: "test")))
    }
}
