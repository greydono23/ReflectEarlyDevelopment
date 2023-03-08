//
//  CommunityServiceNoteItemView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/4/23.
//

import Firebase
import FirebaseFirestoreSwift
import Foundation
import SwiftUI

struct CommunityServiceNoteItemView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var note: CommunityServiceModel
    
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
                Text(note.organization)
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
    
    init(note: CommunityServiceModel) {
        self.note = note
    }
}



//struct CommunityServiceNoteItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        CommunityServiceNoteItemView(noteViewModel: CommunityServiceNoteViewModel(note: CommunityServiceNote(noteName: "test", organization: "test", hours: 3.00, description: "test", keyDetail: "test", revelation: "test", freeThought: "test")))
//    }
//}
