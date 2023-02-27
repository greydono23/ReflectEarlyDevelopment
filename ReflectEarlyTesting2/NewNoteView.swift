//
//  NewNoteView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 2/25/23.
//

import SwiftUI

struct NewNoteView: View {
    @State private var noteName = ""
    @State private var organizationName = ""
    @State private var noteBody = ""
    @State private var experienceType = ""
    @State private var experienceTags = ""
    
    let experienceTypes = ["Service", "Project", "Class", "Program", "Work"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Note Name", text: $noteName)
                    TextField("Organization", text: $organizationName)
                    Picker("Experience Type", selection: $experienceType) {
                        ForEach(experienceTypes, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section(header: Text("Reflection")) {
                    TextEditor(text: $noteBody)
                    TextField("Tags", text: $experienceTags)
                }
                
                Section {
                    Button("Save Note") {
                        // func to upload to database
                    }
                }
            }
            .navigationTitle("New Note")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct NewNoteView_Previews: PreviewProvider {
    static var previews: some View {
        NewNoteView()
    }
}
