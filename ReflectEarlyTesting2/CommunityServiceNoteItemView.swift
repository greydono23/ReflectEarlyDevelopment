//
//  CommunityServiceNoteItemView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/4/23.
//

import SwiftUI

struct CommunityServiceNoteItemView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var noteViewModel: CommunityServiceNoteViewModel
    
    var body: some View {
        VStack {
            Text(noteViewModel.note.noteName)
            Text(noteViewModel.note.organization)
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
    
    init(noteViewModel: CommunityServiceNoteViewModel) {
        self.noteViewModel = noteViewModel
    }
}

struct CommunityServiceNoteItemView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityServiceNoteItemView(noteViewModel: CommunityServiceNoteViewModel(note: CommunityServiceNote(noteName: "test", organization: "test", hours: 3.00, description: "test", keyDetail: "test", revelation: "test", freeThought: "test")))
    }
}
