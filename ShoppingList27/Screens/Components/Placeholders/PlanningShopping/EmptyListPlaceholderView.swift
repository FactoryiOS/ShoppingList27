//
//  PlanningShoppingPlaceholderView.swift
//  ShoppingList27
//
//  Created by Алина on 04.09.2025.
//

import SwiftUI

/// Плейсхолдер экрана "Давайте спланируем покупки".
/// Отображает картинку и текстовые подсказки, по центру экрана.
struct EmptyListPlaceholderView: View {
    
    private enum Constants {
        static let mainText = "Давайте спланируем покупки!"
        static let subText = "Создайте свой первый список"
    }
    
    private let title3Medium = Font.system(size: 20, weight: .medium)
    private let regular17 = Font.system(size: 17, weight: .regular)
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 28) {
                imageContent
                textContent
            }
            .padding(.horizontal, 49)
            .frame(
                width: getContainerWidth(for: geometry),
                height: getContainerHeight(for: geometry),
                alignment: .center
            )
            .position(getContainerPosition(for: geometry))
        }
    }
    
    private var imageContent: some View {
        Image("createList")
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity, maxHeight: 300)
    }
    
    private var textContent: some View {
        VStack(spacing: 4) {
            headlineText
            supportingText
        }
        .frame(maxWidth: .infinity)
    }
    
    private var headlineText: some View {
        Text(Constants.mainText)
            .font(title3Medium)
            .foregroundColor(.grey80)
            .lineLimit(1)
            .minimumScaleFactor(0.5)
    }
    
    private var supportingText: some View {
        Text(Constants.subText)
            .font(regular17)
            .foregroundColor(.grey80)
            .lineLimit(1)
            .minimumScaleFactor(0.5)
    }
}

// MARK: - Extension
private extension EmptyListPlaceholderView {
    /// Возвращает ширину контейнера плейсхолдера в зависимости от размеров родительского `GeometryProxy`
    /// - Parameter geometry: `GeometryProxy` родительского контейнера
    /// - Returns: Ширина контейнера
    func getContainerWidth(for geometry: GeometryProxy) -> CGFloat {
        geometry.size.width
    }
    
    /// Возвращает высоту контейнера плейсхолдера в зависимости от размеров родительского `GeometryProxy`
    /// - Parameter geometry: Контейнер занимает 50% высоты родителя
    /// - Returns: Высота контейнера
    func getContainerHeight(for geometry: GeometryProxy) -> CGFloat {
        geometry.size.height * 0.5
    }
    
    /// Вычисляет центр контейнера плейсхолдера по оси X и Y
    /// Используется для позиционирования контейнера по центру родителя
    /// - Parameter geometry: `GeometryProxy` родительского контейнера
    /// - Returns: `CGPoint` с координатами центра контейнера
    func getContainerPosition(for geometry: GeometryProxy) -> CGPoint {
        CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
    }
}

// MARK: - Preview
struct PlanningShoppingPlaceholderViewPreviews: PreviewProvider {
    static var previews: some View {
        EmptyListPlaceholderView()
    }
}
