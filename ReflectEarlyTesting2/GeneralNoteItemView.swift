//
//  GeneralNoteItemView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/5/23.
//

import SwiftUI

struct GeneralNoteItemView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var note: GeneralNoteModel
    
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
                Text("Activity")
                    .foregroundColor(.gray)
                Text(note.activity)
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
    
    init(note: GeneralNoteModel) {
        self.note = note
    }
}

//struct GeneralNoteItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        GeneralNoteItemView(noteViewModel: GeneralNoteViewModel(note: GeneralNote(noteName: "test", activity: "test", hours: 3, description: "test", keyDetail: "test", revelation: "test", freeThought: "test")))
//    }
//}
