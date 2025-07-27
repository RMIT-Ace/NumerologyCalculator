//
//  ContentView.swift
//  Numero Calculator Watch App
//
//  Created by Ace on 26/7/2025.
//

import SwiftUI

struct WatchContentView: View {
    @State var digits: [Int] = [ 0, 0, 0, 0, 0, 0, 0, 0 ]
    @State var numeroNumber: Int = 0
    @State var isMasterNumberReduced: Bool = false

    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                Text("\(numeroNumber)")
                    .font(.system(size: 38, weight: .bold, design: .default))
                    .frame(width: 38 * 2)
                    .padding(.horizontal, 10)
                    .cornerRadius(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(style: StrokeStyle(lineWidth: 2))
                    }
                Toggle("Reduce", isOn: $isMasterNumberReduced)
                    .toggleStyle(ButtonToggleStyle())
            }
            
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(0..<8) { i in
                        DigitPickerView(digit: $digits[i])
                    }
                }
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
    WatchContentView()
}
