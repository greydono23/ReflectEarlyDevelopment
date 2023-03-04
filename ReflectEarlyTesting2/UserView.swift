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
            .navigationTitle("Home")
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
