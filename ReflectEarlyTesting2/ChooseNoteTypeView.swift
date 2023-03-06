//
//  NewNoteView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 2/25/23.
//

import SwiftUI

struct ChooseNoteTypeView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    
                    /// can/should the repetitive code below be created with a ForEach / some modifier extension?

                    Spacer()
                    
                    VStack {
                        Text("CHOOSE")
                            .font(.custom("Teko-Light", size: 40)) // how to make size adaptive?
                        Text("WHICH TYPE OF EXPERIENCE DO YOU WANT TO REFLECT UPON?")
                            .font(.custom("Teko-Light", size: 25)) // how to make size adaptive?
                            .foregroundColor(.gray)
                            .frame(width: geometry.size.width*(3/4))
                            .multilineTextAlignment(.center)
                    }
                    Spacer()
                    
                    /// classwork
                    NavigationLink {
                        SchoolWorkNoteView(accountViewModel: AccountViewModel())
                    } label: {
                        HStack {
                            Image(systemName: "text.book.closed")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(colorScheme == .dark ? .black : .white)
                                .frame(width: geometry.size.width/13)
                                .padding(.leading, 30)
                            Spacer()
                            Text("SCHOOL WORK")
                                .font(.custom("Teko-Light", size: 30)) // how to make size adaptive?
                                .foregroundStyle(colorScheme == .dark ? .black : .white)
                                .padding(.trailing, 30)
                        }
                        .padding([.top, .bottom], 15)
                        .frame(width: geometry.size.width*(5/6))
                        .background(.mint)
                        .cornerRadius(20)
                    }
                    
                    /// community service
                    NavigationLink {
                        CommunityServiceNoteView(accountViewModel: AccountViewModel())
                    } label: {
                        HStack {
                            Image(systemName: "megaphone")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(colorScheme == .dark ? .black : .white)
                                .frame(width: geometry.size.width/13)
                                .padding(.leading, 30)
                            Spacer()
                            Text("COMMUNITY SERVICE")
                                .font(.custom("Teko-Light", size: 30)) // how to make size adaptive?
                                .foregroundStyle(colorScheme == .dark ? .black : .white)
                                .padding(.trailing, 30)
                        }
                        .padding([.top, .bottom], 15)
                        .frame(width: geometry.size.width*(5/6))
                        .background(.mint)
                        .cornerRadius(20)
                    }
                    
                    /// Independent Project
                    NavigationLink {
                        IndependentProjectNoteView(accountViewModel: AccountViewModel())
                    } label: {
                        HStack {
                            Image(systemName: "keyboard")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(colorScheme == .dark ? .black : .white)
                                .frame(width: geometry.size.width/13)
                                .padding(.leading, 30)
                            Spacer()
                            Text("INDEPENDENT PROJECT")
                                .font(.custom("Teko-Light", size: 30)) // how to make size adaptive?
                                .foregroundStyle(colorScheme == .dark ? .black : .white)
                                .padding(.trailing, 30)
                        }
                        .padding([.top, .bottom], 15)
                        .frame(width: geometry.size.width*(5/6))
                        .background(.mint)
                        .cornerRadius(20)
                    }
                    
                    /// Summer Program
                    NavigationLink {
                        SummerProgramNoteView(accountViewModel: AccountViewModel())
                    } label: {
                        HStack {
                            Image(systemName: "text.magnifyingglass")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(colorScheme == .dark ? .black : .white)
                                .frame(width: geometry.size.width/13)
                                .padding(.leading, 30)
                            Spacer()
                            Text("SUMMER PROGRAM")
                                .font(.custom("Teko-Light", size: 30)) // how to make size adaptive?
                                .foregroundStyle(colorScheme == .dark ? .black : .white)
                                .padding(.trailing, 30)
                        }
                        .padding([.top, .bottom], 15)
                        .frame(width: geometry.size.width*(5/6))
                        .background(.mint)
                        .cornerRadius(20)
                    }
                    
                    /// Work
                    NavigationLink {
                        WorkExperienceNoteView(accountViewModel: AccountViewModel())
                    } label: {
                        HStack {
                            Image(systemName: "hands.clap.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(colorScheme == .dark ? .black : .white)
                                .frame(width: geometry.size.width/13)
                                .padding(.leading, 30)
                            Spacer()
                            Text("WORK EXPERIENCE")
                                .font(.custom("Teko-Light", size: 30)) // how to make size adaptive?
                                .foregroundStyle(colorScheme == .dark ? .black : .white)
                                .padding(.trailing, 30)
                        }
                        .padding([.top, .bottom], 15)
                        .frame(width: geometry.size.width*(5/6))
                        .background(.mint)
                        .cornerRadius(20)
                    }
                    
                    /// Work
                    NavigationLink {
                        GeneralNoteView(accountViewModel: AccountViewModel())
                    } label: {
                        HStack {
                            Image(systemName: "star.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(colorScheme == .dark ? .black : .white)
                                .frame(width: geometry.size.width/13)
                                .padding(.leading, 30)
                            Spacer()
                            Text("GENERAL")
                                .font(.custom("Teko-Light", size: 30)) // how to make size adaptive?
                                .foregroundStyle(colorScheme == .dark ? .black : .white)
                                .padding(.trailing, 30)
                        }
                        .padding([.top, .bottom], 15)
                        .frame(width: geometry.size.width*(5/6))
                        .background(.mint)
                        .cornerRadius(20)
                    }
                }
                .padding(.bottom, 20)
            }
        }
    }
}

struct NewNoteView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseNoteTypeView()
    }
}
