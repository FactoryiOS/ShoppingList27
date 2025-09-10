//
//  ProductCellView.swift
//  ShoppingList27
//
//  Created by Hajime4Life on 10.09.2025.
//

import SwiftUI

struct ProductCellView: View {
    
    var product: ProductCellModel
    
    @Binding var isChecked: Bool

    var body: some View {
        HStack {
            Button("", action: { isChecked.toggle() })
            .buttonStyle(.checkbox(isChecked: isChecked))
            
            Group {
                Text(product.name)
                
                Spacer()
                Text("\(product.count) \(product.unitMeasure.shortName)")
            }
            .foregroundColor(isChecked ? .hint : .grey80)
        }
    }
}

#Preview {
    @Previewable @State var isChecked1 = false
    @Previewable @State var isChecked2 = false
    @Previewable @State var isChecked3 = false
    
    let productCellPreview = VStack(alignment: .leading, spacing: 20) {
        ProductCellView(product: .mock1, isChecked: $isChecked1)
            .padding(.horizontal)
        Divider()
        ProductCellView(product: .mock2, isChecked: $isChecked2)
            .padding(.horizontal)
        Divider()
        ProductCellView(product: .mock3, isChecked: $isChecked3)
            .padding(.horizontal)
    }
    .frame(maxHeight: .infinity)
    .background(Color.backgroundScreen)
    
    productCellPreview
        .colorScheme(.light)
    
    productCellPreview
        .colorScheme(.dark)
}
