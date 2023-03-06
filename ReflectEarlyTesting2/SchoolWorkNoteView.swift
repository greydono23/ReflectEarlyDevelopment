//
//  SchoolWorkNoteView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 2/28/23.
//

import SwiftUI

struct SchoolWorkNoteView: View {
    @ObservedObject var accountViewModel: AccountViewModel
    
    @State private var noteName = ""
    @State private var className = ""
    @State private var description = ""
    @State private var keyDetail = ""
    @State private var reveal = ""
    @State private var freeThought = ""
    
    var body: some View {
        
//        GeometryReader { geometry in
//            HStack {
//                Spacer()
//                ScrollView {
//                    VStack(alignment: .leading) {
//                        HStack {
//                            Text("Note Name: ")
//                            TextField("-", text: $noteName)
//                        }
//                        HStack {
//                            Text("Class/Club: ")
//                            TextField("-", text: $className)
//                        }
//
//                        Text("Description")
//                        TextEditor(text: $experienceDescription)
//                            .background(.mint)
//
//                        Text("Key Detail")
//                        TextEditor(text: $keyDetail)
//                            .background(.mint)
//
//                        Text("What does this reveal about you?")
//                        TextEditor(text: $reveal)
//                            .background(.mint)
//
//                        Text("Reflect Freely!")
//                        TextEditor(text: $freeThought)
//                            .background(.mint)
//                    }
//                    .padding()
//                    .frame(width: geometry.size.width*(9/10))
//                    .background {
//                        Rectangle()
//                            .foregroundColor(.mint)
//                            .frame(width: geometry.size.width*(19/20))
//                    }
//                }
//
//
//
//                Spacer()
//            }
//            
//        }
        
        
        NavigationView {
            Form {
                Section(header: Text("Note Name").foregroundColor(.mint)) {
                    TextField("Note Name", text: $noteName)
                }
                Section(header: Text("Class/Club Name").foregroundColor(.mint)) {
                    TextField("Class/Club Name", text: $className)
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
        let note = SchoolWorkNote(noteName: noteName, className: className, description: description, keyDetail: keyDetail, revelation: reveal, freeThought: freeThought)
        
        accountViewModel.addSchoolWorkNote(note)
    }
    
}

struct SchoolWorkNoteView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolWorkNoteView(accountViewModel: AccountViewModel())
    }
}
