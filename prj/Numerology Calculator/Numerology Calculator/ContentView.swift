//
//  ContentView.swift
//  Numerology Calculator
//
//  Created by Ace on 25/7/2025.
//

import SwiftUI

struct ContentView: View {
    @State var digits: [Int] = [ 0, 0, 0, 0, 0, 0, 0, 0 ]
    @State var numeroNumber: Int = 0
    @State var isMasterNumberReduced: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                Text("\(numeroNumber)")
                    .font(.system(size: 48, weight: .bold, design: .default))
                    .frame(width: 48 * 2)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .cornerRadius(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(style: StrokeStyle(lineWidth: 2))
                    }
                Toggle("Reduce\nmaster\nnumber", isOn: $isMasterNumberReduced)
                    .toggleStyle(ButtonToggleStyle())
            }
            .padding(.top, 20)
            
            HStack(spacing: 12) {
                ForEach(0..<8) { i in
                    DigitPickerView(digit: $digits[i])
                }
            }
            
            Spacer()
            VStack {
               ScrollView {
                    Text(numberMeanings[numeroNumber] ?? "")
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .italic()
                }
            }
            .frame(height: 300)
            .frame(maxWidth: .infinity)
            .padding()
            .cornerRadius(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(style: StrokeStyle(lineWidth: 2))
            }
            .padding()
            
            Spacer()
        }
        .padding(.horizontal, 6)
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
