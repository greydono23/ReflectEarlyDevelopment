//
//  IndependentProjectNoteItemView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/4/23.
//

import SwiftUI

struct IndependentProjectNoteItemView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var note: IndependentProjectModel
    
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
                Text(note.projectName)
                    .padding(.bottom, 5)
            }
            
            Group {
                Text("Hours")
                    .foregroundColor(.gray)
                Text("\(note.hours)")
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
    
    init(note: IndependentProjectModel) {
        self.note = note
    }
}

//struct IndependentProjectNoteItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        IndependentProjectNoteItemView(noteViewModel: IndependentProjectNoteViewModel(note: IndependentProjectNote(noteName: "ip", projectName: "ip", hours: 2.75, description: "ip", keyDetail: "ip", revelation: "ip", freeThought: "ip")))
//    }
//}
