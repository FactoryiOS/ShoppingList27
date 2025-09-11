//
//  ProductCellView.swift
//  ShoppingList27
//
//  Created by Hajime4Life on 10.09.2025.
//

import SwiftUI

struct ProductCellView: View {
    private let viewModel: ProductCellViewModel
    
    init(viewModel: ProductCellViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            Button("", action: { viewModel.toggleChecked()})
                .buttonStyle(.checkbox(isChecked: viewModel.isChecked))
            
            Group {
                Text(viewModel.product.name)
                
                Spacer()
                Text("\(viewModel.product.count) \(viewModel.product.unitMeasure.shortName)")
            }
            .foregroundColor(viewModel.isChecked ? .hint : .grey80)
        }
    }
}

#Preview {
    let productCellPreview = VStack(alignment: .leading, spacing: 20) {
        ProductCellView(viewModel: ProductCellViewModel(model: .mock1))
            .padding(.horizontal, 28)
        Divider()
        ProductCellView(viewModel: ProductCellViewModel(model: .mock2))
            .padding(.horizontal, 28)
        Divider()
        ProductCellView(viewModel: ProductCellViewModel(model: .mock3))
            .padding(.horizontal, 28)
    }
    .frame(maxHeight: .infinity)
    .background(Color.backgroundScreen)
    
    productCellPreview
        .colorScheme(.light)
    
    productCellPreview
        .colorScheme(.dark)
}
