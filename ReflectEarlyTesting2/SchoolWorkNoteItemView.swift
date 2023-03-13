//
//  ViewNotesView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/1/23.
//

import SwiftUI

struct SchoolWorkNoteItemView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var note: SchoolWorkModel
    
    var body: some View {
        
        VStack {
            VStack {
                HStack {
                    Text("Class/Club")
                        .foregroundColor(.mint)
                        .font(.custom("Outfit-Semibold", size: 20))
                    Text("\(note.className)")
                        .font(.custom("Outfit-Medium", size: 17))
                }
                HStack {
                    Text("Note Name")
                        .foregroundColor(.mint)
                        .font(.custom("Outfit-Semibold", size: 20))
                    Text("\(note.noteName)")
                        .font(.custom("Outfit-Medium", size: 17))
                }
            }
            .padding(1)

            Text("Description")
                .font(.custom("Outfit-Semibold", size: 20))
                .foregroundColor(.mint)
            Text("\(note.description)")
                .font(.custom("Outfit-Medium", size: 17))
                .padding(.bottom, 1)
            
            Text("Key Detail")
                .font(.custom("Outfit-Semibold", size: 20))
                .foregroundColor(.mint)
            Text("\(note.keyDetail)")
                .font(.custom("Outfit-Medium", size: 17))
                .padding(.bottom, 1)
            
            Text("This Reveals...")
                .font(.custom("Outfit-Semibold", size: 20))
                .foregroundColor(.mint)
            Text("\(note.revelation)")
                .font(.custom("Outfit-Medium", size: 17))
                .padding(.bottom, 1)
            
            Text("Additional Thoughts")
                .font(.custom("Outfit-Semibold", size: 20))
                .foregroundColor(.mint)
            Text("\(note.freeThought)")
                .font(.custom("Outfit-Medium", size: 17))
                .padding(.bottom, 1)
        }
        .padding()
    }

    init(note: SchoolWorkModel) {
        self.note = note
    }
}

struct SchoolWorkNoteItemView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolWorkNoteItemView(note: SchoolWorkModel(noteName: "AP Lit", className: "Poop", description: "skdjcnskdjcnskjdcskdjcskjdncskjncksjdncksjdncksdjncskjdcn", keyDetail: "skjcndkjcnskdjcnskdjcnskdjncskjdncskjdncskjdncskjdncskdjncskdjcnsdkcnjsdcj", revelation: "ksjdncskjcnksdncskdjncskjdcnskdncskjdncskjdncskjdncsdcjnc", freeThought: "kcsjdncskjncskjdncskdjncksjdncskdjcnskdjcndjkcnskdjcnskjdcnskjdcn"))
    }
}


