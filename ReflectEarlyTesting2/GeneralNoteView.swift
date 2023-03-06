//
//  GeneralNoteView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/5/23.
//

import SwiftUI

struct GeneralNoteView: View {
    
    @ObservedObject var accountViewModel: AccountViewModel

    @State private var noteName = ""
    @State private var activity = ""
    @State private var hours = 1.0
    @State private var description = ""
    @State private var keyDetail = ""
    @State private var reveal = ""
    @State private var freeThought = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Note Name").foregroundColor(.mint)) {
                    TextField("Note Name", text: $noteName)
                }
                Section(header: Text("Organization").foregroundColor(.mint)) {
                    TextField("Organization", text: $activity)
                }
                Section(header: Text("Hours").foregroundColor(.mint)) {
                    HStack {
                        Slider(value: $hours, in: 0...5, step: 0.25)
                        Text("\(hours, specifier: "%.2f")")
                            .foregroundColor(.mint)
                    }
                }
                Section(header: Text("Describe Your Experience").foregroundColor(.mint)) {
                    TextEditor(text: $description)
                }
                Section(header: Text("Specific Detail").foregroundColor(.mint)) {
                    TextEditor(text: $keyDetail)
                }
                Section(header: Text("What Does this reveal about you?").foregroundColor(.mint)) {
                    TextEditor(text: $reveal)
                }
                Section(header: Text("Write freely").foregroundColor(.mint)) {
                    TextEditor(text: $freeThought)
                }

            }
            .navigationTitle("New Note")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button {
                        addNote()
                    } label: {
                        Text("Save")
                    }
                }
            }
        }

    }
    
    private func addNote() {
        let note = GeneralNote(noteName: noteName, activity: activity, hours: hours, description: description, keyDetail: keyDetail, revelation: reveal, freeThought: freeThought)
        
        accountViewModel.addGeneralNote(note)
    }
}

struct GeneralNoteView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralNoteView(accountViewModel: AccountViewModel())
    }
}
