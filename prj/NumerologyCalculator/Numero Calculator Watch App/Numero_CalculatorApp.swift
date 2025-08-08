//
//  Numero_CalculatorApp.swift
//  Numero Calculator Watch App
//
//  Created by Ace on 26/7/2025.
//

import SwiftUI
import Numerology

@main
struct Numero_Calculator_Watch_AppApp: App {
    private var numerologyVm: NumerologyViewModel = .init()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environment(numerologyVm)
    }
}
