//
//  SummerProgramNoteItemView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/5/23.
//

import SwiftUI

struct SummerProgramNoteItemView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var note: SummerProgramModel
    
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
                Text(note.programName)
                    .padding(.bottom, 5)
            }
            
            Group {
                Text("Hours")
                    .foregroundColor(.gray)
                Text("\(note.hours)")
                    .padding(.bottom, 5)
            }
            
            Group {
                Text("Weeks")
                    .foregroundColor(.gray)
                Text("\(note.weeks)")
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
                Text(note.favorite)
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
    
    init(note: SummerProgramModel) {
        self.note = note
    }
}

//struct SummerProgramNoteItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        SummerProgramNoteItemView(noteViewModel: SummerProgramNoteViewModel(note: SummerProgramModel(noteName: "test", programName: "test", hours: 5.5, weeks: 3, description: "test", favorite: "test", revelation: "test", freeThought: "test")))
//    }
//}
