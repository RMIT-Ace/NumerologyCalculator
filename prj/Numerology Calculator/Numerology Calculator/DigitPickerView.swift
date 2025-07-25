//
//  DigitPickerView.swift
//  Numerology Calculator
//
//  Created by Ace on 25/7/2025.
//

import SwiftUI

struct DigitPickerView: View {
    
    @Binding var digit: Int
    
    var body: some View {
        VStack(spacing: 0) {
            Button {
                digit += 1
                if digit > 9 {
                    digit = 0
                }
            } label: {
                Image(systemName: "triangle")
                    .padding(.vertical, 10)
                    .padding(.horizontal, 2)
            }

            Text("\(digit)")
                .font(.system(size: 24, weight: .bold, design: .default))
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .cornerRadius(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(style: StrokeStyle(lineWidth: 2))
                }
            
            Button {
                digit -= 1
                if digit < 0 {
                    digit = 9
                }
            } label: {
                Image(systemName: "triangle")
                    .rotationEffect(.degrees(180))
                    .padding(.vertical, 10)
                    .padding(.horizontal, 2)
            }

        }
        .padding(2)
    }
}

#Preview {
    @Previewable @State var digits: [Int] = [ 1, 2, 3, 4, 5, 6, 7, 8 ]
    HStack(spacing: 0) {
        ForEach(0..<8) { i in
            DigitPickerView(digit: $digits[i])
        }
    }
    .padding()
}
