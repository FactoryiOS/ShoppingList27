//
//  PlanningShoppingPlaceholderVM.swift
//  ShoppingList27
//
//  Created by Алина on 04.09.2025.
//

import SwiftUI

// MARK: - ViewModel

/// ViewModel для плейсхолдера экрана "Давайте спланируем покупки".
/// Содержит статические данные: заголовок, картинку и текстовые сообщения.
@MainActor
final class PlanningShoppingPlaceholderVM: ObservableObject {
    
    private enum Constants {
        static let imageName = "createList"
        static let mainText = "Давайте спланируем покупки!"
        static let subText = "Создайте свой первый список"
    }
    
    @Published var imageName: String = Constants.imageName
    @Published var mainText: String = Constants.mainText
    @Published var subText: String = Constants.subText
}
