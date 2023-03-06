//
//  ViewSchoolWorkNotes.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/6/23.
//

import SwiftUI

struct ViewSchoolWorkNotes: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var accountViewModel = AccountViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ForEach(accountViewModel.schoolWorkNoteViewModels) { noteViewModel in
                    SchoolWorkNoteItemView(noteViewModel: noteViewModel)
                        .padding()
                }
            }
        }
    }
}

struct ViewSchoolWorkNotes_Previews: PreviewProvider {
    static var previews: some View {
        ViewSchoolWorkNotes()
    }
}
