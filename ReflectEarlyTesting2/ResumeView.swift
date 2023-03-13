//
//  ResumeView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/9/23.
//

import Firebase
import SwiftUI

struct ResumeView: View {
    @StateObject var resumeViewModel = ResumeViewModel()
    @StateObject var serviceNotesViewModel = InspectServiceNotesViewModel.serviceNotesViewModel
    
    @State private var communityServiceHours = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                HStack {
                    Spacer()
                    
                    VStack {
                        VStack {
                            Text("Community Service")
                                .font(.custom("Outfit-Bold", size: 35))
                                .padding(.bottom, 1)
                            
                            HStack {
                                VStack {
                                    Text("Hours")
                                        .foregroundColor(.gray)
                                    Text("\(resumeViewModel.totalCommunityServiceHours, specifier: "%.2f")")
                                        .foregroundColor(.mint)
                                }
                                .padding(.leading)
                                Spacer()
                                VStack {
                                    Text("Organizations")
                                        .foregroundColor(.gray)
                                    Text("4")
                                        .foregroundColor(.purple)
                                }
                                .padding(.trailing)
                            }
                            .font(.custom("Outfit-Semibold", size: 25))
                            
                            /// create a list or foreach of all of the organizations and hours per organization (maybe a dropdown button
                        }
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundStyle(.ultraThinMaterial)
                        }
                        
                        VStack {
                            Text("Projects")
                                .font(.custom("Outfit-Bold", size: 35))
                                .padding(.bottom, 1)
                            
                            HStack {
                                VStack {
                                    Text("Hours")
                                        .foregroundColor(.gray)
//                                    Text("\(resumeViewModel.totalHours, specifier: "%.2f")")
                                        Text("3.00")
                                        .foregroundColor(.mint)
                                }
                                .padding(.leading)
                                Spacer()
                                VStack {
                                    Text("Projects")
                                        .foregroundColor(.gray)
                                    Text("4")
                                        .foregroundColor(.purple)
                                }
                                .padding(.trailing)
                            }
                            .font(.custom("Outfit-Semibold", size: 25))
                        }
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundStyle(.ultraThinMaterial)
                        }
                    }
                    .padding()
                    
                    Spacer()
                }
            }
        }
        .onAppear() {
            resumeViewModel.setup()
        }
    }
}

class ResumeViewModel: ObservableObject {
    @ObservedObject var serviceNotesViewModel = InspectServiceNotesViewModel.serviceNotesViewModel
    
    @Published var userName = ""
    @Published var totalCommunityServiceHours = 0.0
    
    func setup() {
        /// get user name, school, year
//        Firestore.firestore().collection("students")
//            .whereField("userId", isEqualTo: Auth.auth().currentUser!.uid)
//            .addSnapshotListener { querySnapshot, error in
//                if let error = error {
//                    print("Error getting name: \(error.localizedDescription)")
//                    return
//                }
//
//                self.userName = docu
//            }
        
        serviceNotesViewModel.setup()
        totalCommunityServiceHours = serviceNotesViewModel.getTotalCommunityServiceHours()
    }
}

struct ResumeView_Previews: PreviewProvider {
    static var previews: some View {
        ResumeView()
    }
}
