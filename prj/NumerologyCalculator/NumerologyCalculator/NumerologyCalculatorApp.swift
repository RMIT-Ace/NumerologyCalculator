//
//  NumerologyCalculatorApp.swift
//  NumerologyCalculator
//
//  Created by Ace on 8/8/2025.
//

import SwiftUI
import Numerology

@main
struct NumerologyCalculatorApp: App {
    private var vm = NumerologyViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environment(vm)
    }
}
