//
//  Numerology_CalculatorApp.swift
//  Numerology Calculator
//
//  Created by Ace on 25/7/2025.
//

import SwiftUI
import Numerology

@main
struct Numerology_CalculatorApp: App {
    private var numerologyVm: NumerologyViewModel = .init()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environment(numerologyVm)
    }
}
