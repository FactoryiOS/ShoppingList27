//
//  PlanningShoppingPlaceholderView.swift
//  ShoppingList27
//
//  Created by Алина on 04.09.2025.
//

import SwiftUI


/// Плейсхолдер экрана "Давайте спланируем покупки".
/// Отображает картинку и текстовые подсказки, по центру экрана.
struct PlanningShoppingPlaceholderView: View {
    
    @StateObject private var viewModel = PlanningShoppingPlaceholderVM()
    
    var body: some View {
        VStack(spacing: 28) {
            imageContent
            textContent
        }
        .padding(.top, 190)
        .padding(.bottom, 232)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private var imageContent: some View {
        Image(viewModel.imageName)
            .resizable()
            .scaledToFill()
            .clipped()
            .background(Color.clear)
            .padding(.horizontal, 49)
    }
    
    private var textContent: some View {
        VStack(spacing: 4) {
            headlineText
            supportingText
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 16)
        .background(Color.clear)
    }
    
    private var headlineText: some View {
        Text(viewModel.mainText)
            .font(.title3Medium)
            .foregroundColor(.grey80)
            .multilineTextAlignment(.center)
            .lineLimit(1)
            .background(Color.clear)
    }
    
    private var supportingText: some View {
        Text(viewModel.subText)
            .font(.regular17)
            .foregroundColor(.grey80)
            .multilineTextAlignment(.center)
            .lineLimit(1)
            .background(Color.clear)
    }
}

// MARK: - Preview
struct PlanningShoppingPlaceholderViewPreviews: PreviewProvider {
    static var previews: some View {
        PlanningShoppingPlaceholderView()
    }
}
