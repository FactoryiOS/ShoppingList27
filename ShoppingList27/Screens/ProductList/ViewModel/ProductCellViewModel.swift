//
//  ProductCellViewModel.swift
//  ShoppingList27
//
//  Created by Hajime4Life on 11.09.2025.
//

import SwiftUI

@Observable
final class ProductCellViewModel {
    var product: ProductCellModel
    var isChecked: Bool
    
    init(model: ProductCellModel, isChecked: Bool = false) {
        self.product = model
        self.isChecked = isChecked
    }
    
    func toggleChecked() {
        isChecked.toggle()
    }
}
