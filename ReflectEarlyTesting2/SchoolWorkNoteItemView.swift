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
                Group {
                    Text("Note Name")
                        .foregroundColor(.gray)
                        .padding(.top)
                    Text(noteViewModel.note.noteName)
                        .padding(.bottom, 5)
                }

                Group {
                    Text("Class/Club Name")
                        .foregroundColor(.gray)
                    Text(noteViewModel.note.className)
                        .padding(.bottom, 5)
                }
            
                Group {
                    Text("Description")
                        .foregroundColor(.gray)
                    Text(noteViewModel.note.description)
                        .padding(.bottom, 5)
                }
                
                Group {
                    Text("Key Detail")
                        .foregroundColor(.gray)
                    Text(noteViewModel.note.keyDetail)
                        .padding(.bottom, 5)
                }
                
                Group {
                    Text("This Reaveals...")
                        .foregroundColor(.gray)
                    Text(noteViewModel.note.revelation)
                        .padding(.bottom, 5)
                }
                
                Group {
                    Text("Additional Thoughts")
                        .foregroundColor(.gray)
                    Text(noteViewModel.note.freeThought)
                        .padding(.bottom)
                    
                }
            }
            .foregroundColor(colorScheme == .dark ? .black : .white)
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
