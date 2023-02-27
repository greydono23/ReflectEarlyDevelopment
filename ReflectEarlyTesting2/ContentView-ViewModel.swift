//
//  ContentView-ViewModel.swift
//  ReflectEarlyTesting2
//
//  Created by Greydon O'Keefe on 2/25/23.
//

import Foundation
import SwiftUI

extension ContentView {
    
    @MainActor class ContentViewModel: ObservableObject {
        
        @Published var screenWidth = UIScreen.main.bounds.width
        @Published var screenHeight = UIScreen.main.bounds.height
        
    }
    
}
