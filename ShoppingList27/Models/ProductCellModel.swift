//
//  ProductCellModel.swift
//  ShoppingList27
//
//  Created by Hajime4Life on 10.09.2025.
//

import SwiftUI

// Для выбора ед. изм. в дальнейшем
enum UnitOfMeasure: String, CaseIterable, Identifiable {
    case kilogram = "кг."
    case gram = "г."
    case liter = "л."
    case pack = "уп."
    case box = "кор."
    case bottle = "бут."
    case can = "банка"
    case roll = "рулон"
    case pair = "пара"
    case piece = "шт."
    
    // Может понадобиться при создании для отображения в ForEach понадобится ID
    var id: String { rawValue }
    
    // Для вывода в текст
    var shortName: String { rawValue }
}

struct ProductCellModel: Identifiable {
    var id: UUID = UUID()
    var name: String
    var count: Int
    var unitMeasure: UnitOfMeasure
    
    static let mock1 = ProductCellModel(name: "Чайник", count: 2, unitMeasure: .piece)
    static let mock2 = ProductCellModel(name: "Вода", count: 2, unitMeasure: .bottle)
    static let mock3 = ProductCellModel(name: "Макароны", count: 4, unitMeasure: .pack)
}
