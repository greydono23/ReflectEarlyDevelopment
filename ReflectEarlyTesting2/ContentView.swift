//
//  ContentView.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 2/24/23.
//

import SwiftUI

struct BackgroundDesign: View {
    
    var screenWidth: CGFloat
    var screenHeight: CGFloat
    
    var body: some View {
        Rectangle()
            .frame(width: 1000, height: screenHeight/17)
            .foregroundStyle(.linearGradient(colors: [.black, .blue, .teal, .green], startPoint: .bottomTrailing, endPoint: .topLeading))
            .rotationEffect(.degrees(135))
            .offset(y: -(screenHeight/3.75))
        
        Rectangle()
            .frame(width: 1000, height: screenHeight/20)
            .foregroundStyle(.linearGradient(colors: [.green, .teal, .blue, .black], startPoint: .bottomTrailing, endPoint: .topLeading))
            .foregroundStyle(.thinMaterial)
            .rotationEffect(.degrees(-140))
            .offset(y: -(screenHeight/2.75))
        
        Rectangle()
            .frame(width: 1000, height: screenHeight/7)
            .foregroundStyle(.linearGradient(colors: [.blue, .teal, .green], startPoint: .bottomTrailing, endPoint: .topLeading))
            .rotationEffect(.degrees(135))
            .offset(y: -(screenHeight/2.25))
    }
}

struct outlineTextField: ViewModifier {
    var roundedCornes: CGFloat
    var startColor: Color
    var endColor: Color
    var textColor: Color

    func body(content: Content) -> some View {
        content
            .padding()
            .cornerRadius(roundedCornes)
            .font(.custom("Open Sans", size: 20))
            .foregroundColor(textColor)
            .overlay(
                RoundedRectangle(cornerRadius: roundedCornes)
                    .stroke(
                        LinearGradient(gradient: Gradient(colors: [startColor, endColor]),startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.5)
            )
    }
}
