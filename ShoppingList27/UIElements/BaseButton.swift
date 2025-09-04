//
//  baseButton.swift
//  ShoppingList27
//
//  Created by Owi Lover on 9/3/25.
//

import SwiftUI

struct BaseButton: View {
    let isActive: Bool
    let title: String
    let action: () -> Void
    
    private let titleFont: Font = Font.system(size: 17, weight: .medium)
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(titleFont)
                .foregroundStyle(isActive ? Color.white : Color.hint)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 11)
                .padding(.horizontal, 20)
        }
        .background(isActive ? Color.uniTurquoise : Color.button)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    BaseButton(isActive: false, title: "Test", action: {
        print("I was tapped!")
    })
}
