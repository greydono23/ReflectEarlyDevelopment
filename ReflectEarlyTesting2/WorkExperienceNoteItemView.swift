//
//  WorkExperienceNoteItemView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/5/23.
//

import SwiftUI

struct WorkExperienceNoteItemView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var note: WorkExperienceModel
    
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
                Text(note.employer)
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
    
    init(note: WorkExperienceModel) {
        self.note = note
    }
}
