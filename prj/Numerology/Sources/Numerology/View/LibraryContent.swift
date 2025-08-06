//
//  LibraryContent.swift
//  Numerology Calculator
//
//  Created by Ace on 6/8/2025.
//

import SwiftUI
import DeveloperToolsSupport
import Numerology

struct MyNumeroViewsLibrary: @MainActor LibraryContentProvider {
    @MainActor
    var views: [LibraryItem] {
        LibraryItem(
            SimpleNumberPickerView(digit: .constant(0)),
            title: "Numero Simple Number Picker",
            category: .control
        )
        LibraryItem(
            RoundedCornerButton("Tap me!", action: { }),
            title: "Numero Rounded Corner Button",
            category: .control
        )
        LibraryItem(
            UpDownNumberPickerView(digit: .constant(0)),
            title: "Numero Up/Down Number Picker",
            category: .control
        )
    }
}
