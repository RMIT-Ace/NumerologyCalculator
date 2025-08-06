//
//  DigitPickerView.swift
//  Numerology Calculator
//
//  Created by Ace on 25/7/2025.
//

import SwiftUI

public struct UpDownNumberPickerView: View {
    
    @Binding var digit: Int
    
    public init(digit: Binding<Int>) {
        self._digit = digit
    }
    
    public var body: some View {
        VStack(spacing: 8) {
            Button {
                digit += 1
                if digit > 9 {
                    digit = 0
                }
            } label: {
                ZStack {
                    Color.black.opacity(0.01)
                        .frame(width: 28, height: 28)
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: 4, height: 4)
                }
            }
            .buttonStyle(.plain)
            
            Text("\(digit)")
                .font(.system(size: 26, weight: .bold, design: .default))
                .frame(width: 20)
                .overlay {
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(style: StrokeStyle(lineWidth: 1))
                }
            
            Button {
                digit -= 1
                if digit < 0 {
                    digit = 9
                }
            } label: {
                ZStack {
                    Color.black.opacity(0.01)
                        .frame(width: 28, height: 28)
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: 4, height: 4)
                }
            }
            .buttonStyle(.plain)
            
        }
    }
}

#Preview {
    @Previewable @State var digits: [Int] = [ 1, 2, 3, 4, 5, 6, 7, 8 ]
    ScrollView(.horizontal) {
        HStack(spacing: 0) {
            ForEach(0..<8) { i in
                UpDownNumberPickerView(digit: $digits[i])
            }
        }
    }
}
