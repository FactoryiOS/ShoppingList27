//
//  ProductCellModel.swift
//  ShoppingList27
//
//  Created by Hajime4Life on 10.09.2025.
//

import SwiftUI

// Это у нас моделька с состоянием
@Observable
final class ProductCellModel {
    var product: Product
    var isBought: Bool
    
    init(model: Product, isBought: Bool = false) {
        self.product = model
        self.isBought = isBought
    }
    
    func toggleChecked() {
        isBought.toggle()
    }
}

// Для выбора ед. изм. в дальнейшем
enum UnitOfMeasure: String, CaseIterable, Identifiable {
    case kilogram = "кг."
    case gram = "г."
    case liter = "л."
    case mlt = "мл."
    case piece = "шт."
    
    // Может понадобиться при создании для отображения в ForEach понадобится ID
    var id: String { rawValue }
    
    // Для вывода в текст
    var shortName: String { rawValue }
}

struct Product: Identifiable {
    var id: UUID = UUID()
    var name: String
    var count: Int
    var unitMeasure: UnitOfMeasure
    
    static let mock1 = Product(name: "Чайник", count: 2, unitMeasure: .piece)
    static let mock2 = Product(name: "Вода", count: 2, unitMeasure: .liter)
    static let mock3 = Product(name: "Макароны", count: 4, unitMeasure: .mlt)
}
