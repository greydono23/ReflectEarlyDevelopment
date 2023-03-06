//
//  SummerProgramNoteItemView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/5/23.
//

import SwiftUI

struct SummerProgramNoteItemView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var noteViewModel: SummerProgramNoteViewModel
    
    var body: some View {
        VStack {
            Text(noteViewModel.note.noteName)
            Text(noteViewModel.note.programName)
            Text("\(noteViewModel.note.hours, specifier: "%.2f")")
            Text("\(noteViewModel.note.weeks, specifier: "%.2f")")
            Text(noteViewModel.note.description)
            Text(noteViewModel.note.favorite)
            Text(noteViewModel.note.revelation)
            Text(noteViewModel.note.freeThought)
        }
        .foregroundColor(colorScheme == .dark ? .black : .white)
        .frame(width: 300, height: 300)
        .background(.mint)
        .cornerRadius(30)
        .padding()
    }
    
    init(noteViewModel: SummerProgramNoteViewModel) {
        self.noteViewModel = noteViewModel
    }
}

struct SummerProgramNoteItemView_Previews: PreviewProvider {
    static var previews: some View {
        SummerProgramNoteItemView(noteViewModel: SummerProgramNoteViewModel(note: SummerProgramModel(noteName: "test", programName: "test", hours: 5.5, weeks: 3, description: "test", favorite: "test", revelation: "test", freeThought: "test")))
    }
}
