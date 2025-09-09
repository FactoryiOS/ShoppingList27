//
//  DesignSelector.swift
//  ShoppingList27
//
//  Created by Owi Lover on 9/9/25.
//

import SwiftUI

struct DesignSelector: View {
    @Binding var selectedIcon: String
    
    var selectionColor: Color?
    
    private var titleText: String = "Выберите дизайн"
    private var titleFont = Font.system(size: 16, weight: .regular)
    
    init(selectedIcon: Binding<String>, selectionColor: Color?) {
        self._selectedIcon = selectedIcon
        self.selectionColor = selectionColor
    }
    
    private enum Icons: String, CaseIterable {
        case airplane
        case alert
        case balloon
        case bandage
        case barbell
        case bed
        case briefcase
        case build
        case business
        case calendar
        case car
        case cart
        case colorPalette
        case fastFood
        case gameController
        case gift
        case paw
        case snowflake
    }
    
    var body: some View {
        mainView
            .background(Color.bgcolor)
            .clipShape(
                RoundedRectangle(cornerRadius: 12)
            )
    }
    
    private var mainView: some View {
        VStack(spacing: 12) {
            HStack(spacing: 0) {
                title
                Spacer()
            }
            .padding(.horizontal, 12)
            iconsGrid
        }
        .padding(.vertical, 12)
    }
    
    private var title: some View {
        Text(titleText)
            .font(titleFont)
            .foregroundColor(.grey80)
    }
    
    private struct IconViewCell: View {
        var iconName: String
        var isSelected: Bool = false
        var selectedColor: Color
        
        static let height: CGFloat = 48
        static let width: CGFloat = 48
        
        var body: some View {
            ZStack {
                Circle()
                    .fill(isSelected ? selectedColor : .backgroundIcon)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: IconViewCell.width, height: IconViewCell.height)
                
                Image(iconName)
                    .foregroundColor(isSelected ? .colorBackConstant : .colorWhite)
            }
        }
    }
    
    private func makeColumns(count: Int, spacingBetweenColumns spacing: CGFloat, maxColumnWidth width: CGFloat) -> [GridItem] {
        Array(repeating: GridItem(.fixed(width), spacing: spacing), count: count)
    }
    
    private func makeVGrid(columnsCount: Int, spacingBetweenColumns: CGFloat = 8, maxColumnWidth: CGFloat = 48) -> some View {
        LazyVGrid(columns: makeColumns(count: columnsCount,
                                       spacingBetweenColumns: spacingBetweenColumns,
                                       maxColumnWidth: maxColumnWidth),
                  alignment: .center,
                  spacing: 12) {

            ForEach(Icons.allCases, id: \.self) { icon in
                let iconName = icon.rawValue
                Button {
                    selectIcon(iconName)
                } label: {
                    IconViewCell(iconName: iconName,
                                 isSelected: iconName == selectedIcon,
                                 selectedColor: selectionColor ?? .backgroundIcon.opacity(0.5)
                    )
                }
            }
        }
    }
    
    private func selectIcon(_ iconName: String) {
        selectedIcon = iconName
    }
    
    private var iconsGrid: some View {
        makeVGrid(columnsCount: 6)
    }
    
}

#Preview {
    @Previewable @State var selection: String = ""
    let selectionColor: Color? = .addGreen

    VStack {
        ZStack {
            Color.backgroundScreen
            DesignSelector(selectedIcon: $selection, selectionColor: selectionColor)
                .padding(16)
        }
        .colorScheme(.light)
        ZStack {
            Color.backgroundScreen
            DesignSelector(selectedIcon: $selection, selectionColor: selectionColor)
                .padding(16)
        }
        .colorScheme(.dark)
    }
    .ignoresSafeArea()
    
    .onChange(of: selection) {
        print(selection)
    }
}
