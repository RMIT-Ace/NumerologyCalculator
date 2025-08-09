//
//  ContentView.swift
//  Numerology Calculator
//
//  Created by Ace on 9/8/2025.
//

import SwiftUI
import Numerology

struct ContentView: View {
    @Environment(NumerologyViewModel.self) var vm
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    NumerologyView()
                } label: {
                    Image("RMIT-logo")
                        .resizable()
                        .frame(width: 200, height: 200)
                }
                .buttonStyle(.plain)

                Text("Welcome to HAPI!")
                    .bold(true)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
        .environment(NumerologyViewModel())
}
