//
//  BaseTextField.swift
//  ShoppingList27
//
//  Created by Hajime4life on 07.09.2025.
//

import SwiftUI

struct BaseTextField: View {
    let placeholder: String
    @Binding var text: String
    @State private var hasError: Bool = true
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField(placeholder, text: $text)
                    .tint(.uniTurquoise)
                    .foregroundColor(.grey80)
                
                Button(action: {
                    
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.hint)
                }
                .opacity(text.count > 0 ? 1 : 0)
            }
            .padding()
            .background(Color.white) // В ассетах нет этого фона, он в темной и белой теме отличается в макете
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(hasError ? Color.uniRed : Color.clear, lineWidth: 0.5)
            )
            
            Text("Этот товар уже есть в списке, добавьте другой")
                .font(.system(size: 13))
                .foregroundColor(.uniRed)
        }
        .padding(.horizontal)

    }
}

#Preview {
    VStack {
        BaseTextField(placeholder: "Название списка", text: .constant(""))
        BaseTextField(placeholder: "Название списка", text: .constant("sdf"))
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.backgroundScreen)
}
