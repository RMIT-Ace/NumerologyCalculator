//
//  SwiftUIView.swift
//  Numerology
//
//  Created by Ace on 6/8/2025.
//

import SwiftUI

public struct RoundedCornerButton: View {
    var title: String
    var action: @MainActor () -> Void
    
    public init(
        _ title: String = "Button",
        action: @escaping @MainActor () -> Void = {}
    ) {
        self.title = title
        self.action = action
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(style: StrokeStyle(lineWidth: 1))
                }
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    RoundedCornerButton()
    RoundedCornerButton("Reset") { print("Click!")}
}
