//
//  ContentView.swift
//  Numerology Calculator
//
//  Created by Ace on 25/7/2025.
//

import SwiftUI
import Numerology

struct ContentView: View {
    @State var maxDigits = 4
    @State var digits: Array<Int> = .init()
    @State var numeroNumber: Int = 0
    @State var isMasterNumberReduced: Bool = false
    
    var body: some View {
        List {
            Section {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(0 ..< maxDigits, id: \.self) { i in
                            UpDownNumberPickerView(digit: $digits[i])
                        }
                    }
                }
                .scrollIndicators(.hidden)
            } header: {
                Text("Inputs (\(maxDigits)):")
            } footer: {
                HStack {
                    Spacer()
                    RoundedCornerButton("C") { resetAllDigits() }
                    RoundedCornerButton("+") { reshapeDigits(maxDigits + 1) }
                    RoundedCornerButton("-") { reshapeDigits(maxDigits - 1) }
                }
            }

            Section("Numerology number") {
                HStack {
                    Text("\(numeroNumber)")
                        .font(.system(size: 48, weight: .bold, design: .default))
                        .frame(width: 48 * 2)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(style: StrokeStyle(lineWidth: 2))
                        }
                    Toggle("Reduce", isOn: $isMasterNumberReduced)
                        .toggleStyle(ButtonToggleStyle())
                }
            }
            
            Section("Prediction") {
                Text(numberMeanings[numeroNumber] ?? "")
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .italic()
            }

        }
        .onAppear {
            resetAllDigits()
        }
        .onChange(of: digits) { _, newDigits in
            numeroNumber = calculateNumeroNumber(newDigits, reduceMasterNumber: isMasterNumberReduced)
        }
        .onChange(of: isMasterNumberReduced) { _, _ in
            numeroNumber = calculateNumeroNumber(digits, reduceMasterNumber: isMasterNumberReduced)
        }
    }
    
    private func resetAllDigits() {
        digits = Array<Int>(repeating: 0, count: maxDigits )
        numeroNumber = calculateNumeroNumber(digits, reduceMasterNumber: isMasterNumberReduced)
    }
    
    private func reshapeDigits(_ numberOfDigits: Int) {
        guard numberOfDigits > 0 && numberOfDigits <= 15 && numberOfDigits != maxDigits else {
            print("WARN: Invalid number of digits: \(numberOfDigits)")
            return
        }
        maxDigits = numberOfDigits
        resetAllDigits()
    }
}

#Preview {
    ContentView()
}

import Playgrounds
#Playground {
    let series1 = 12345
    let digitArray1 = numberToDigits(series1)
    let numeroNumber1 = calculateNumeroNumber(digitArray1, reduceMasterNumber: false)
    let isMasterNumeroNumber1 = isMasterNumber(numeroNumber1)
    
    let series2 = 24102002
    let digitArray2 = numberToDigits(series2)
    let numeroNumber2 = calculateNumeroNumber(digitArray2, reduceMasterNumber: false)
    let isMasterNumeroNumber2 = isMasterNumber(numeroNumber2)
}

