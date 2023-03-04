//
//  AccountView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/1/23.
//

import SwiftUI

struct AccountView: View {
    @ObservedObject var accountViewModel = AccountViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                GeometryReader { geometry in
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            ForEach(accountViewModel.schoolWorkNoteViewModels) { noteViewModel in
                                SchoolWorkNoteItemView(noteViewModel: noteViewModel)
                                    .padding([.leading, .trailing])
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem {
                    NavigationLink {
                        SettingsView()
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .foregroundColor(.mint)
                    }
                }
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
