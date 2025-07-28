//
//  ContentView.swift
//  Numerology Calculator
//
//  Created by Ace on 25/7/2025.
//

import SwiftUI
import Numerology

struct ContentView: View {
    static let allZeros = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
    @State var digits: [Int] = allZeros
    @State var numeroNumber: Int = 0
    @State var isMasterNumberReduced: Bool = false
    
    var body: some View {
        List {
            Section("Input digits") {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(0 ..< 10) { i in
                            DigitPickerView(digit: $digits[i])
                        }
                        Button {
                            digits = Self.allZeros
                        } label: {
                            Text("Reset")
                                .padding()
                                .overlay {
                                    RoundedRectangle(cornerRadius: 6)
                                        .stroke(style: StrokeStyle(lineWidth: 1))
                                }
                        }
                    }
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
        .onChange(of: digits) { _, newDigits in
            numeroNumber = calculateNumeroNumber(newDigits, reduceMasterNumber: isMasterNumberReduced)
        }
        .onChange(of: isMasterNumberReduced) { _, _ in
            numeroNumber = calculateNumeroNumber(digits, reduceMasterNumber: isMasterNumberReduced)
        }
    }
}

#Preview {
    ContentView()
}
