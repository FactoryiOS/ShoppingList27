//
//  ContentView.swift
//  ShoppingList27
//
//  Created by Nikita Tsomuk on 01.09.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      
        HStack {
            Image("snowflake")
                .renderingMode(.template)
                .foregroundColor(.turquoise)
            Text("Hello, Factory!")
        }
        .padding()
    }
}

#Preview {
    Color.blue
         .ignoresSafeArea()
         .overlay(
    ContentView()
    )
}
