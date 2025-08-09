//
//  HScrollSectionView.swift
//  Numerology Calculator
//
//  Created by Ace on 9/8/2025.
//

import SwiftUI
import Numerology

struct HScrollSectionView: View {
    @Binding var digits: Array<Int>
    var cellView: (_ digit: Binding<Int>) -> any View
    var header: () -> any View
    var footer: () -> any View

    public init(
        _ digits: Binding<Array<Int>>,
        cellView: @escaping (_ digit: Binding<Int>) -> any View,
        header: @escaping () -> any View = { EmptyView() },
        footer: @escaping () -> any View = { EmptyView() }
    ) {
        self._digits = digits
        self.cellView = cellView
        self.header = header
        self.footer = footer
    }
    
    var body: some View {
        Section {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0 ..< digits.count, id: \.self) { i in
                        AnyView( cellView($digits[i]) )
                    }
                }
            }
            .scrollIndicators(.hidden)
        } header: {
            AnyView(header())
        } footer: {
            AnyView(footer())
        }
    }
}

#Preview {
    @Previewable @State
    var digits: Array<Int> = .init(repeating: 0, count: 15)
    
    HScrollSectionView($digits) { digit in UpDownNumberPickerView(digit: digit) }
    header: { Text("Hello") }
        .padding()
    
    HScrollSectionView($digits) { digit in SimpleNumberPickerView(digit: digit) }
    footer: {
        HStack {
            Spacer()
            RoundedCornerButton("C") { }
            RoundedCornerButton("+") { }
            RoundedCornerButton("-") { }
        }
    }
    .padding()
}
