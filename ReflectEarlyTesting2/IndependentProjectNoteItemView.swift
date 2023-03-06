//
//  IndependentProjectNoteItemView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/4/23.
//

import SwiftUI

struct IndependentProjectNoteItemView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var noteViewModel: IndependentProjectNoteViewModel
    
    var body: some View {
        VStack {
            Text(noteViewModel.note.noteName)
            Text(noteViewModel.note.projectName)
            Text("\(noteViewModel.note.hours, specifier: "%.2f")")
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
    
    init(noteViewModel: IndependentProjectNoteViewModel) {
        self.noteViewModel = noteViewModel
    }
}

struct IndependentProjectNoteItemView_Previews: PreviewProvider {
    static var previews: some View {
        IndependentProjectNoteItemView(noteViewModel: IndependentProjectNoteViewModel(note: IndependentProjectNote(noteName: "ip", projectName: "ip", hours: 2.75, description: "ip", keyDetail: "ip", revelation: "ip", freeThought: "ip")))
    }
}
