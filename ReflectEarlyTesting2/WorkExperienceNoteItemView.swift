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
            VStack {
                HStack {
                    Text("Employer")
                        .foregroundColor(.mint)
                        .font(.custom("Outfit-Semibold", size: 20))
                    Text("\(note.employer)")
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
                    VStack {
                        Text("Weeks")
                            .foregroundColor(.mint)
                            .font(.custom("Outfit-Semibold", size: 20))
                        Text("\(note.weeks, specifier: "%.2f")")
                            .font(.custom("Outfit-Medium", size: 17))
                    }
                    .padding(.trailing)
                    VStack {
                        Text("Hours")
                            .foregroundColor(.mint)
                            .font(.custom("Outfit-Semibold", size: 20))
                        Text("\(note.hours, specifier: "%.2f")")
                            .font(.custom("Outfit-Medium", size: 17))
                    }
                    .padding(.leading)
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
    
    init(note: WorkExperienceModel) {
        self.note = note
    }
}
