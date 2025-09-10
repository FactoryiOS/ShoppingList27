//
//  ColorPickerView.swift
//  ShoppingList27
//
//  Created by Alesia Matusevich on 08/09/2025.
//

import SwiftUI

struct ColorPickerView: View {
    
    @State private var selectedColor: Color?
    
    let colors: [Color] = [.addGreen, .addPurple, .addBlue, .addRed, .addYellow]
    let title: String = "Цвет"
    
    var body: some View {
        VStack {
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack(spacing: 0) {
                Spacer()
                ForEach(colors, id: \.self) { color in
                    ZStack {
                        if selectedColor == color {
                            Circle()
                                .stroke(Color.teal, lineWidth: 2)
                                .frame(width: 48, height: 48)
                        }
                        Circle()
                            .fill(color)
                            .frame(width: 40, height: 40)
                    }
                    .frame(width: 48, height: 48)
                    .contentShape(Circle())
                    .onTapGesture {
                        selectedColor = (selectedColor == color) ? nil : color
                    }
                    Spacer()
                }
            }
        }
        .padding()
        .background(.bgcolor)
        .cornerRadius(12)
    }
}

#Preview {
    ColorPickerView()
}
