//
//  AccountView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/1/23.
//

/// megaphone, keyboard, text.magnifyingglass, hands.clap.fill, star.fill
import SwiftUI

struct AccountView: View {
    @Environment(\.colorScheme) var colorScheme
        
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    HStack {
                        Spacer()
                        VStack {
                            Image("examplePFP")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width/4)
                                .clipShape(Circle())
                            
                            Text("user53803")
                                .font(.custom("Teko-Light", size: 25))
                                .foregroundColor(.gray)
                                .padding(.top, -3)
                        }
                        Spacer()
                        VStack {
                            Text("NOTES")
                                .font(.custom("Teko-Light", size: 20))
                                .foregroundColor(.gray)
                            Text("34")
                                .font(.custom("Teko-Light", size: 25))
                                .foregroundColor(.mint)
                        }
                        Spacer()
                    }

                    HStack {
                        NavigationLink {
                            InspectSchoolNotesView()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.mint)
                                    .frame(width: geometry.size.width/3.5, height: geometry.size.height/7)
                                    .overlay {
                                        VStack {
                                            Image(systemName: "text.book.closed")
                                                .resizable()
                                                .scaledToFit()
                                                .foregroundStyle(colorScheme == .dark ? .black : .white)
                                                .frame(width: geometry.size.width/10)
                                            Text("School")
                                                .foregroundColor(colorScheme == .dark ? .black : .white)
                                                .font(.title2)
                                                .bold()
                                        }
                                        .padding([.bottom, .top])
                                    }
                            }
                        }
                        NavigationLink {
                            InpsectServiceNotesView()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.mint)
                                    .frame(width: geometry.size.width/3.5, height: geometry.size.height/7)
                                    .overlay {
                                        VStack {
                                            Image(systemName: "megaphone")
                                                .resizable()
                                                .scaledToFit()
                                                .foregroundStyle(colorScheme == .dark ? .black : .white)
                                                .frame(width: geometry.size.width/10)
                                            Text("Service")
                                                .foregroundColor(colorScheme == .dark ? .black : .white)
                                                .font(.title2)
                                                .bold()
                                        }
                                        .padding([.bottom, .top])
                                    }
                            }
                        }
                        NavigationLink {
                            InspectProjectNotesView()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.mint)
                                    .frame(width: geometry.size.width/3.5, height: geometry.size.height/7)
                                    .overlay {
                                        VStack {
                                            Image(systemName: "keyboard")
                                                .resizable()
                                                .scaledToFit()
                                                .foregroundStyle(colorScheme == .dark ? .black : .white)
                                                .frame(width: geometry.size.width/10)
                                            Text("Projects")
                                                .foregroundColor(colorScheme == .dark ? .black : .white)
                                                .font(.title2)
                                                .bold()
                                        }
                                        .padding([.bottom, .top])
                                    }
                            }
                        }
                    }

                    HStack {
                        NavigationLink {
                            InspectProgramNotesView()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.mint)
                                    .frame(width: geometry.size.width/3.5, height: geometry.size.height/7)
                                    .overlay {
                                        VStack {
                                            Image(systemName: "text.magnifyingglass")
                                                .resizable()
                                                .scaledToFit()
                                                .foregroundStyle(colorScheme == .dark ? .black : .white)
                                                .frame(width: geometry.size.width/10)
                                            Text("Programs")
                                                .foregroundColor(colorScheme == .dark ? .black : .white)
                                                .font(.title2)
                                                .bold()
                                        }
                                        .padding([.bottom, .top])
                                    }
                            }
                        }
                        NavigationLink {
                            InspectWorkExperienceNotesView()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.mint)
                                    .frame(width: geometry.size.width/3.5, height: geometry.size.height/7)
                                    .overlay {
                                        VStack {
                                            Image(systemName: "hands.clap.fill")
                                                .resizable()
                                                .scaledToFit()
                                                .foregroundStyle(colorScheme == .dark ? .black : .white)
                                                .frame(width: geometry.size.width/10)
                                            Text("Work")
                                                .foregroundColor(colorScheme == .dark ? .black : .white)
                                                .font(.title2)
                                                .bold()
                                        }
                                        .padding([.bottom, .top])
                                    }
                            }
                        }
                        NavigationLink {
                            InspectGeneralNotesView()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.mint)
                                    .frame(width: geometry.size.width/3.5, height: geometry.size.height/7)
                                    .overlay {
                                        VStack {
                                            Image(systemName: "star.fill")
                                                .resizable()
                                                .scaledToFit()
                                                .foregroundStyle(colorScheme == .dark ? .black : .white)
                                                .frame(width: geometry.size.width/10)
                                            Text("General")
                                                .foregroundColor(colorScheme == .dark ? .black : .white)
                                                .font(.title2)
                                                .bold()
                                        }
                                        .padding([.bottom, .top])
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
        
//        NavigationView {
//            ScrollView {
//                VStack {
//                    ScrollView(.horizontal) {
//                        HStack(spacing: 10) {
//                            ForEach(accountViewModel.schoolWorkNoteViewModels) { noteViewModel in
//                                SchoolWorkNoteItemView(noteViewModel: noteViewModel)
//                                    .padding([.leading, .trailing])
//                            }
//                        }
//                    }
//                    ScrollView(.horizontal) {
//                        HStack(spacing: 10) {
//                            ForEach(accountViewModel.communityServiceNoteViewModels) { noteViewModel in
//                                CommunityServiceNoteItemView(noteViewModel: noteViewModel).padding([.leading, .trailing])
//                            }
//                        }
//                    }
//                    ScrollView(.horizontal) {
//                        HStack(spacing: 10) {
//                            ForEach(accountViewModel.independentProjectNoteViewModels) { noteViewModel in
//                                IndependentProjectNoteItemView(noteViewModel: noteViewModel).padding([.leading, .trailing])
//                            }
//                        }
//                    }
//                    ScrollView(.horizontal) {
//                        HStack(spacing: 10) {
//                            ForEach(accountViewModel.summerProgramNoteViewModels) { noteViewModel in
//                                SummerProgramNoteItemView(noteViewModel: noteViewModel).padding([.leading, .trailing])
//                            }
//                        }
//                    }
//                    ScrollView(.horizontal) {
//                        HStack(spacing: 10) {
//                            ForEach(accountViewModel.workExperienceNoteViewModels) { noteViewModel in
//                                WorkExperienceNoteItemView(noteViewModel: noteViewModel).padding([.leading, .trailing])
//                            }
//                        }
//                    }
//                    ScrollView(.horizontal) {
//                        HStack(spacing: 10) {
//                            ForEach(accountViewModel.generalNoteViewModels) { noteViewModel in
//                                GeneralNoteItemView(noteViewModel: noteViewModel).padding([.leading, .trailing])
//                            }
//                        }
//                    }
//                }
//
//            }
//            .toolbar {
//                ToolbarItem {
//                    NavigationLink {
//                        SettingsView()
//                    } label: {
//                        Image(systemName: "gearshape.fill")
//                            .foregroundColor(.mint)
//                    }
//                }
//            }
//        }
    }
}

//struct GeneralFolder: View {
//    @Environment(\.colorScheme) var colorScheme
//
//    var body: some View {
//        GeometryReader { geometry in
//            RoundedRectangle(cornerRadius: 10)
//                .foregroundColor(.indigo)
//                .frame(width: geometry.size.width/2, height: geometry.size.height/1.5)
//                .offset(x: -(geometry.size.width/3))
//            RoundedRectangle(cornerRadius: geometry.size.width/20)
//                .foregroundColor(.indigo)
//                .frame(width: geometry.size.width/2, height: geometry.size.height/10)
//                .offset(y: (geometry.size.height/3.53))
//            Text("GENERAL")
//                .font(.custom("Teko-Light", size: 40))
//                .foregroundColor(colorScheme == .dark ? .black : .white)
//                .offset(x: geometry.size.width/13, y: geometry.size.width/1.92)
//        }
//    }
//}
//
//struct WorkFolder: View {
//    @Environment(\.colorScheme) var colorScheme
//
//    var body: some View {
//        GeometryReader { geometry in
//            RoundedRectangle(cornerRadius: 10)
//                .foregroundColor(.purple)
//                .frame(width: geometry.size.width/2, height: geometry.size.height/1.5)
//                .offset(x: -(geometry.size.width/2.75), y: -(geometry.size.height/40))
//            RoundedRectangle(cornerRadius: geometry.size.width/20)
//                .foregroundColor(.purple)
//                .frame(width: geometry.size.width/2, height: geometry.size.height/10)
//                .offset(x: -(geometry.size.width)/40, y: (geometry.size.height/5.7))
//            Text("WORK")
//                .font(.custom("Teko-Light", size: 40))
//                .foregroundColor(colorScheme == .dark ? .black : .white)
//                .offset(x: geometry.size.width/20, y: geometry.size.width/3.05)
//        }
//    }
//}
//
//struct ProgramsFolder: View {
//    @Environment(\.colorScheme) var colorScheme
//
//    var body: some View {
//        GeometryReader { geometry in
//            RoundedRectangle(cornerRadius: 10)
//                .foregroundColor(.blue)
//                .frame(width: geometry.size.width/2, height: geometry.size.height/1.5)
//                .offset(x: -(geometry.size.width/2.47), y: -(geometry.size.height/20))
//            RoundedRectangle(cornerRadius: geometry.size.width/20)
//                .foregroundColor(.blue)
//                .frame(width: geometry.size.width/2, height: geometry.size.height/10)
//                .offset(x: -(geometry.size.width)/20, y: (geometry.size.height/14.9))
//            Text("PROGRAMS")
//                .font(.custom("Teko-Light", size: 40))
//                .foregroundColor(colorScheme == .dark ? .black : .white)
//                .offset(x: geometry.size.width/340, y: geometry.size.width/7.75)
//        }
//    }
//}
//
//struct ProjectFolder: View {
//    @Environment(\.colorScheme) var colorScheme
//
//    var body: some View {
//        GeometryReader { geometry in
//            RoundedRectangle(cornerRadius: 10)
//                .foregroundColor(.teal)
//                .frame(width: geometry.size.width/2, height: geometry.size.height/1.5)
//                .offset(x: -(geometry.size.width/2.25), y: -(geometry.size.height/14))
//            RoundedRectangle(cornerRadius: geometry.size.width/20)
//                .foregroundColor(.teal)
//                .frame(width: geometry.size.width/2, height: geometry.size.height/10)
//                .offset(x: -(geometry.size.width)/14, y: -(geometry.size.height/25))
//            Text("PROJECTS")
//                .font(.custom("Teko-Light", size: 40))
//                .foregroundColor(colorScheme == .dark ? .black : .white)
//                .offset(x: -(geometry.size.width/50), y: -(geometry.size.width/15))
//        }
//    }
//}
//
//struct ServiceFolder: View {
//    @Environment(\.colorScheme) var colorScheme
//
//    var body: some View {
//        GeometryReader { geometry in
//            RoundedRectangle(cornerRadius: 10)
//                .foregroundColor(.green)
//                .frame(width: geometry.size.width/2, height: geometry.size.height/1.5)
//                .offset(x: -(geometry.size.width/2.1), y: -(geometry.size.height/11))
//            RoundedRectangle(cornerRadius: geometry.size.width/20)
//                .foregroundColor(.green)
//                .frame(width: geometry.size.width/2, height: geometry.size.height/10)
//                .offset(x: -(geometry.size.width)/11, y: -(geometry.size.height/6.8))
//            Text("SERVICE")
//                .font(.custom("Teko-Light", size: 40))
//                .foregroundColor(colorScheme == .dark ? .black : .white)
//                .offset(x: -(geometry.size.width/40), y: -(geometry.size.width/1))
//        }
//    }
//}

//struct SchoolFolder: View {
//    @Environment(\.colorScheme) var colorScheme
//
//    var body: some View {
//
//    }
//}
struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
