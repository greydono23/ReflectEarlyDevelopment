//
//  InspectNotesView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/7/23.
//

import SwiftUI

struct InspectNotesView: View {
    @Environment(\.colorScheme) var colorScheme
    
//    let views = [InspectSchoolNotesView(), InpsectServiceNotesView(), InspectProjectNotesView(), InspectProgramNotesView(), InspectWorkExperienceNotesView(), InspectGeneralNotesView()]
//    let images = ["text.book.closed", "megaphone", "keyboard", "text.magnifyingglass", "hands.clap.fill", "star.fill"]
//    let labels = ["School", "Service", "Projects", "Programs", "Work", "General"]
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
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
                            InspectSchoolNotesView()
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
            }
        }
    }
}

struct InspectNotesView_Previews: PreviewProvider {
    static var previews: some View {
        InspectNotesView()
    }
}
