//
//  UserView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 2/25/23.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        NavigationView {
            Form {
//                Section(header: Text("Calendar")) {
//                    HStack {
//                        Text("✅ Volunteer at ECAP")
//                        Spacer()
//                        Text("3:00 PM 2/6")
//                            .font(.caption2)
//                    }
//                    HStack {
//                        Text("⭕️ Sorting at Bundles of Joy")
//                        Spacer()
//                        Text("4:00 PM 2/8")
//                            .font(.caption2)
//                    }
//                    HStack {
//                        Text("⭕️ Competition Paper Due")
//                        Spacer()
//                        Text("10:00 PM 2/10")
//                            .font(.caption2)
//                    }
//                }
                
                Section {
                    HStack {
                        Spacer()
                        VStack {
                            HStack {
                                Text("5")
                                    .font(.largeTitle)
                                    .bold()
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.mint)
                                Text("🔥")
                                    .font(.largeTitle)
                            }
                            Text("Streak")
                                .bold()
                                .padding(.top, 1)
                        }
                        .frame(width: 100, height: 100)

                        Spacer()
                        
                        VStack {
                            Text("1527")
                                .font(.largeTitle)
                                .bold()
                                .multilineTextAlignment(.center)
                                .foregroundColor(.mint)
                            Text("Points")
                                .bold()
                                .padding(1)
                        }
                        .frame(width: 100, height: 100)
                        
                        Spacer()
                    }
                }
            }
            .navigationTitle("ReflectEarly")
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
