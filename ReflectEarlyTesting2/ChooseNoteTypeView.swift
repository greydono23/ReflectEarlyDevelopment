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
                    
                    Spacer()
                    
                    HStack {
                        Text("Academics")
                            .font(.custom("Outfit-Semibold", size: 30))
                            .padding(.leading, 35)
                        Spacer()
                    }
                    /// classwork
                    NavigationLink {
                        SchoolWorkNoteView()
                    } label: {
                        HStack {
                            Text("School Work")
                                .font(.custom("Outfit-Medium", size: 25))
                                .foregroundStyle(colorScheme == .dark ? .white : .black)
                                .padding(.leading, 30)
                            Spacer()
                            Image(systemName: "text.book.closed")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.mint)
                                .frame(width: geometry.size.width/11)
                                .padding(.trailing, 30)
                                .rotationEffect(.degrees(5))
                                .offset(y: 1)
                        }
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.purple.opacity(0.5), lineWidth: 2)
                                .frame(width: geometry.size.width*(5/6), height: geometry.size.height/12)
                                .padding(15)
                        }
                        .frame(width: geometry.size.width*(5/6), height: geometry.size.height/12)
                    }
                    
                    /// Independent Project
                    NavigationLink {
                        IndependentProjectNoteView()
                    } label: {
                        HStack {
                            Text("Project")
                                .font(.custom("Outfit-Medium", size: 25))
                                .foregroundStyle(colorScheme == .dark ? .white : .black)
                                .padding(.leading, 30)
                            Spacer()
                            Image(systemName: "keyboard")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.mint)
                                .frame(width: geometry.size.width/7)
                                .padding(.trailing, 30)
                                .rotationEffect(.degrees(-5))
                                .offset(y: 2)
                        }
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.purple.opacity(0.5), lineWidth: 2)
                                .frame(width: geometry.size.width*(5/6), height: geometry.size.height/12)
                                .padding(15)
                        }
                        .frame(width: geometry.size.width*(5/6), height: geometry.size.height/12)
                    }
                    
                    
                    /// Summer Program
                    NavigationLink {
                        SummerProgramView()
                    } label: {
                        HStack {
                            Text("Summer Program")
                                .font(.custom("Outfit-Medium", size: 25))
                                .foregroundStyle(colorScheme == .dark ? .white : .black)
                                .padding(.leading, 30)
                            Spacer()
                            Image(systemName: "text.magnifyingglass")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.mint)
                                .frame(width: geometry.size.width/9)
                                .padding(.trailing, 30)
                                .rotationEffect(.degrees(0))
                        }
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.purple.opacity(0.5), lineWidth: 2)
                                .frame(width: geometry.size.width*(5/6), height: geometry.size.height/12)
                                .padding(15)
                        }
                        .frame(width: geometry.size.width*(5/6), height: geometry.size.height/12)
                    }
                    
                    HStack {
                        Spacer()
                        Text("Extracurriculars")
                            .font(.custom("Outfit-Semibold", size: 30))
                            .padding([.top, .trailing], 35)
                    }
                    
                    /// community service
                    NavigationLink {
                        CommunityServiceNoteView()
                    } label: {
                        HStack {
                            Image(systemName: "megaphone")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.mint)
                                .frame(width: geometry.size.width/10)
                                .padding(.leading, 30)
                                .rotationEffect(.degrees(-5))
                                .offset(y: 2)
                            Spacer()
                            Text("Service")
                                .font(.custom("Outfit-Medium", size: 25))
                                .foregroundStyle(colorScheme == .dark ? .white : .black)
                                .padding(.trailing, 30)
                        }
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.purple.opacity(0.5), lineWidth: 2)
                                .frame(width: geometry.size.width*(5/6), height: geometry.size.height/12)
                                .padding(15)
                        }
                        .frame(width: geometry.size.width*(5/6), height: geometry.size.height/12)
                    }
                    
                    /// Work
                    NavigationLink {
                        WorkExperienceNoteView()
                    } label: {
                        HStack {
                            Image(systemName: "hands.clap.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.mint)
                                .frame(width: geometry.size.width/8)
                                .padding(.leading, 30)
                            Spacer()
                            Text("Work Experience")
                                .font(.custom("Outfit-Medium", size: 25))
                                .foregroundStyle(colorScheme == .dark ? .white : .black)
                                .padding(.trailing, 30)
                            
                        }
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.purple.opacity(0.5), lineWidth: 2)
                                .frame(width: geometry.size.width*(5/6), height: geometry.size.height/12)
                                .padding(15)
                        }
                        .frame(width: geometry.size.width*(5/6), height: geometry.size.height/12)
                    }
                    
                    /// Work
                    NavigationLink {
                        GeneralNoteView()
                    } label: {
                        HStack {
                            Image(systemName: "star.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.mint)
                                .frame(width: geometry.size.width/9)
                                .padding(.leading, 30)
                                .rotationEffect(.degrees(5))
                            Spacer()
                            Text("General")
                                .font(.custom("Outfit-Medium", size: 25))
                                .foregroundStyle(colorScheme == .dark ? .white : .black)
                                .padding(.trailing, 30)
                        }
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.purple.opacity(0.5), lineWidth: 2)
                                .frame(width: geometry.size.width*(5/6), height: geometry.size.height/12)
                                .padding(15)
                        }
                        .frame(width: geometry.size.width*(5/6), height: geometry.size.height/12)
                    }
                    
                    Spacer()
                }
                .padding(.bottom, 20)
            }
        }
    }
}

class NewNoteViewModel: ObservableObject {
    
    var responses: [String]
    
    func addPoints() {
        var total = 0
        for response in responses {
            total += response.count
        }
        print("\(total)")
        
        /// write to user points total and correct grade points
    }
    
    init(responses: [String]) {
        self.responses = responses
    }
        
        
}

struct NewNoteView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseNoteTypeView()
    }
}
