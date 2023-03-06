//
//  ViewNotesView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/1/23.
//

import SwiftUI

struct SchoolWorkNoteItemView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var note: SchoolWorkNoteModel
    
    var body: some View {
            VStack {
                Group {
                    Text("Note Name")
                        .foregroundColor(.gray)
                        .padding(.top)
                    Text(note.noteName)
                        .padding(.bottom, 5)
                }

                Group {
                    Text("Class/Club Name")
                        .foregroundColor(.gray)
                    Text(note.className)
                        .padding(.bottom, 5)
                }
            
                Group {
                    Text("Description")
                        .foregroundColor(.gray)
                    Text(note.description)
                        .padding(.bottom, 5)
                }
                
                Group {
                    Text("Key Detail")
                        .foregroundColor(.gray)
                    Text(note.keyDetail)
                        .padding(.bottom, 5)
                }
                
                Group {
                    Text("This Reaveals...")
                        .foregroundColor(.gray)
                    Text(note.revelation)
                        .padding(.bottom, 5)
                }
                
                Group {
                    Text("Additional Thoughts")
                        .foregroundColor(.gray)
                    Text(note.freeThought)
                        .padding(.bottom)
                    
                }
            }
            .foregroundColor(colorScheme == .dark ? .black : .white)
            .background(.mint)
            .cornerRadius(30)
            .padding()

        }
    
    init(note: SchoolWorkNoteModel) {
        self.note = note
    }
}

