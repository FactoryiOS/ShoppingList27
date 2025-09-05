//
//  Font+Extension.swift
//  ShoppingList27
//
//  Created by Алина on 04.09.2025.
//

import SwiftUI

/// Расширение для удобного использования кастомного шрифта.
/// Позволяет использовать "Font.title3Medium" вместо повторного указания размера и веса.
/// Список можно дополнять по мере необходимости другими шрифтами.
extension Font {
    
    static var title3Medium: Font {
        Font.system(size: 20, weight: .medium)
    }
    
    static var regular17: Font {
        Font.system(size: 17, weight: .regular)
    }
}
