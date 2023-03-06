//
//  SummerProgramNoteView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/5/23.
//

import SwiftUI

struct SummerProgramNoteView: View {
    @ObservedObject var accountViewModel: AccountViewModel

    @State private var noteName = ""
    @State private var programName = ""
    @State private var hours = 1.0
    @State private var weeks = 1.0
    @State private var description = ""
    @State private var favorite = ""
    @State private var reveal = ""
    @State private var freeThought = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Note Name").foregroundColor(.mint)) {
                    TextField("Note Name", text: $noteName)
                }
                Section(header: Text("Program").foregroundColor(.mint)) {
                    TextField("Program Name", text: $programName)
                }
                Section(header: Text("Time").foregroundColor(.mint)) {
                    HStack {
                        Slider(value: $hours, in: 0...5, step: 0.25)
                        Text("Hours/Day: \(hours, specifier: "%.2f")")
                            .foregroundColor(.mint)
                    }
                    HStack {
                        Slider(value: $weeks, in: 0...10, step: 0.5)
                        Text("Weeks: \(weeks, specifier: "%.2f")")
                            .foregroundColor(.mint)
                    }
                }

                Section(header: Text("Describe Your Experience").foregroundColor(.mint)) {
                    TextEditor(text: $description)
                }
                Section(header: Text("Favorite Lesson/Event").foregroundColor(.mint)) {
                    TextEditor(text: $favorite)
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
        let note = SummerProgramNote(noteName: noteName, programName: programName, hours: hours, weeks: weeks, description: description, favorite: favorite, revelation: reveal, freeThought: freeThought)
        
        accountViewModel.addSummerProgramNote(note)
    }
}

struct SummerProgramNoteView_Previews: PreviewProvider {
    static var previews: some View {
        SummerProgramNoteView(accountViewModel: AccountViewModel())
    }
}
