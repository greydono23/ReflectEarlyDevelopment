//
//  AccountView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/1/23.
//

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
                                .foregroundColor(.gray)
                                .padding(.top, -3)
                        }
                        Spacer()
                        VStack {
                            Text("NOTES")
                                .foregroundColor(.gray)
                            Text("34")
                                .foregroundColor(.mint)
                        }
                        Spacer()
                    }
                    .font(.custom("Outfit-Light", size: 18))
                    .padding(.bottom)
                    
                    HStack {
                        NavigationLink {
                            InspectSchoolNotesView()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.purple.opacity(0.5), lineWidth: 2)
                                    .frame(width: geometry.size.width/3.5, height: geometry.size.height/7)
                                    .overlay {
                                        VStack {
                                            Image(systemName: "text.book.closed")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: geometry.size.width/10)
                                                .foregroundColor(.mint)
                                            Text("School")
                                                .foregroundColor(colorScheme == .dark ? .white : .black)
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
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.purple.opacity(0.5), lineWidth: 2)
                                    .frame(width: geometry.size.width/3.5, height: geometry.size.height/7)
                                    .overlay {
                                        VStack {
                                            Image(systemName: "megaphone")
                                                .resizable()
                                                .scaledToFit()
                                                .foregroundColor(.mint)
                                                .frame(width: geometry.size.width/10)
                                            Text("Service")
                                                .foregroundColor(colorScheme == .dark ? .white : .black)
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
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.purple.opacity(0.5), lineWidth: 2)
                                    .frame(width: geometry.size.width/3.5, height: geometry.size.height/7)
                                    .overlay {
                                        VStack {
                                            Image(systemName: "keyboard")
                                                .resizable()
                                                .scaledToFit()
                                                .foregroundColor(.mint)
                                                .frame(width: geometry.size.width/10)
                                            Text("Projects")
                                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                                .bold()
                                        }
                                        .padding([.bottom, .top])
                                    }
                            }
                        }
                    }
                    .font(.custom("Outfit-Bold", size: 22))
                    
                    HStack {
                        NavigationLink {
                            InspectProgramNotesView()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.purple.opacity(0.5), lineWidth: 2)
                                    .frame(width: geometry.size.width/3.5, height: geometry.size.height/7)
                                    .overlay {
                                        VStack {
                                            Image(systemName: "text.magnifyingglass")
                                                .resizable()
                                                .scaledToFit()
                                                .foregroundColor(.mint)
                                                .frame(width: geometry.size.width/10)
                                            Text("Programs")
                                                .foregroundColor(colorScheme == .dark ? .white : .black)
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
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.purple.opacity(0.5), lineWidth: 2)
                                    .frame(width: geometry.size.width/3.5, height: geometry.size.height/7)
                                    .overlay {
                                        VStack {
                                            Image(systemName: "hands.clap.fill")
                                                .resizable()
                                                .scaledToFit()
                                                .foregroundColor(.mint)
                                                .frame(width: geometry.size.width/10)
                                            Text("Work")
                                                .foregroundColor(colorScheme == .dark ? .white : .black)
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
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.purple.opacity(0.5), lineWidth: 2)
                                    .frame(width: geometry.size.width/3.5, height: geometry.size.height/7)
                                    .overlay {
                                        VStack {
                                            Image(systemName: "star.fill")
                                                .resizable()
                                                .scaledToFit()
                                                .foregroundColor(.mint)
                                                .frame(width: geometry.size.width/10)
                                            Text("General")
                                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                                .bold()
                                        }
                                        .padding([.bottom, .top])
                                    }
                            }
                        }
                    }
                    .font(.custom("Outfit-Bold", size: 22))
                }
                .toolbar {
                    ToolbarItem {
                        NavigationLink {
                            SettingsView()
                        } label: {
                            Image(systemName: "gearshape.fill")
                                .foregroundColor(.purple)
                        }
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
