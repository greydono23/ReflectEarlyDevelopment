//
//  IndependentProjectNoteView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/4/23.
//

import SwiftUI

struct IndependentProjectNoteView: View {
    @ObservedObject var accountViewModel: AccountViewModel
    
    @State private var noteName = ""
    @State private var projectName = ""
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
                Section(header: Text("Project").foregroundColor(.mint)) {
                    TextField("Project Name", text: $projectName)
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
        let note = IndependentProjectNote(noteName: noteName, projectName: projectName, hours: hours, description: description, keyDetail: keyDetail, revelation: reveal, freeThought: freeThought)
        
        accountViewModel.addIndependentProjectNote(note)
    }
}

struct IndependentProjectNoteView_Previews: PreviewProvider {
    static var previews: some View {
        IndependentProjectNoteView(accountViewModel: AccountViewModel())
    }
}
