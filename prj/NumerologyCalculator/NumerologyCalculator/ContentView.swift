//
//  ContentView.swift
//  NumerologyCalculator
//
//  Created by Ace on 8/8/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("RMIT-logo")
                    .resizable()
                    .frame(width: 200, height: 200)
                Text("Welcome to HAPI!")
                    .bold(true)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
