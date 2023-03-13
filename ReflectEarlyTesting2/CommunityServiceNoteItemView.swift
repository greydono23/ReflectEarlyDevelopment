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
            VStack {
                HStack {
                    Text("Organization")
                        .foregroundColor(.mint)
                        .font(.custom("Outfit-Semibold", size: 20))
                    Text("\(note.organization)")
                        .font(.custom("Outfit-Medium", size: 17))
                }
                HStack {
                    Text("Note Name")
                        .foregroundColor(.mint)
                        .font(.custom("Outfit-Semibold", size: 20))
                    Text("\(note.noteName)")
                        .font(.custom("Outfit-Medium", size: 17))
                }
                HStack {
                    Text("Hours")
                        .foregroundColor(.mint)
                        .font(.custom("Outfit-Semibold", size: 20))
                    Text("\(note.hours, specifier: "%.2f")")
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
    
    init(note: CommunityServiceModel) {
        self.note = note
    }
}

struct CommunityServiceNoteItemView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityServiceNoteItemView(note: CommunityServiceModel(noteName: "test", organization: "test", hours: 3.00, description: "test", keyDetail: "test", revelation: "test", freeThought: "test"))
    }
}
