//
//  ContentView.swift
//  Numerology Calculator
//
//  Created by Ace on 25/7/2025.
//

import SwiftUI
import Numerology

struct ContentView: View {
    @Environment(NumerologyViewModel.self) var vm
    
    var body: some View {
        @Bindable var vm = vm
        List {
            HScrollSectionView($vm.digits) { digit in
                UpDownNumberPickerView(digit: digit)
            } header: {
                Text("Inputs (\(vm.digits.count)):")
            } footer: {
                HStack {
                    Spacer()
                    RoundedCornerButton("C") { vm.resetAllDigits() }
                    RoundedCornerButton("+") { vm.maxDigits += 1 }
                    RoundedCornerButton("-") { vm.maxDigits -= 1 }
                }
            }
            
            Section {
                HStack {
                    Spacer()
                    Text("\(vm.numerologyNumber)")
                        .font(.system(size: 48))
                        .bold()
                    Spacer()
                }
            } header: {
                Text("Numerology number:")
            } footer: {
                HStack {
                    Spacer()
                    Toggle("Reduce", isOn: $vm.isMasterNumberReduced)
                        .toggleStyle(SwitchToggleStyle())
                        .frame(width: 130)
                }
            }
            
            Section("Prediction") {
                Text(vm.prediction)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .italic()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }

        }
    }
    
}

#Preview {
    var vm = NumerologyViewModel()
    ContentView()
        .environment(vm)
}
