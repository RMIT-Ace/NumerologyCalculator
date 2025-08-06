//
//  DigitPickerView.swift
//  Numerology Calculator
//
//  Created by Ace on 25/7/2025.
//

import SwiftUI

///
/// Simple number picker
///
/// Provide SwiftUI view for picking a number.
///
public struct SimpleNumberPickerView: View {
    
    @Binding var digit: Int
    
    public init(digit: Binding<Int>) {
        self._digit = digit
    }
    
    public var body: some View {
        Button {
            digit += 1
            if digit > 9 { digit = 0 }
        } label: {
            Text("\(digit)")
                .font(.system(size: 30, weight: .bold, design: .default))
                .frame(width: 30, height: 45)
                .overlay {
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(style: StrokeStyle(lineWidth: 1))
                }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    @Previewable @State var digits: [Int] = [ 1, 2, 3, 4, 5, 6, 7, 8 ]
    ScrollView(.horizontal) {
        HStack(spacing: 4) {
            ForEach(0..<8) { i in
                SimpleNumberPickerView(digit: $digits[i])
            }
        }
    }
}
