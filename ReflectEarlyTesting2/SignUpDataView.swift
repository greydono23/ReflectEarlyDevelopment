//
//  SignUpDataView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 3/9/23.
//

import SwiftUI

struct SignUpDataView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject var viewModel = SignUpViewModel.signUpViewModel
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                Text("Tell Us About Yourself")
                    .font(.custom("Outfit-Regular", size: 30))
                
                Spacer()
                
                HStack {
                    Spacer()
                    Form {
                        Section {
                            TextField("Name", text: $viewModel.name)
                        }
                        Section(header: Text("School Code")) {
                            TextField("", text: $viewModel.schoolCode)
                        }
                        Section(header: Text("Student ID")) {
                            TextField("", text: $viewModel.studentId)
                        }
                    }
                    .font(.custom("Outfit-Light", size: 17))
                    .frame(width: geometry.size.width*(19/20), height: geometry.size.height/2)
                    .cornerRadius(20)
                    Spacer()
                }
                
            
                Spacer()
                
                Button {
                    if viewModel.validCodes() {
                        viewModel.userSignUp()
                    }
                } label: {
                    Text("CONTINUE")
                        .font(.custom("Outfit-Medium", size: 25))
                        .foregroundColor(colorScheme == .dark ? .black : .white)
                        .frame(width: geometry.size.width/2, height: 50)
                        .background(viewModel.validCodes() ? .mint : .gray.opacity(0.3))
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct SignUpDataView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpDataView(viewModel: SignUpViewModel())
    }
}
