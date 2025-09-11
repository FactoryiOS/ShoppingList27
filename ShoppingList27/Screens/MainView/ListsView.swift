//
//  ListsView.swift
//  ShoppingList27
//
//  Created by Vladimir on 11.09.2025.
//

import SwiftUI

// MARK: - ListsMainView
struct ListsMainView: View {
    
    // MARK: - Private Properties
    
    @ObservedObject private var viewModel: ListsViewModel
    @State private var isCreatingNewList: Bool = false
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundScreen
                    .ignoresSafeArea()
                content
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    titleView
                }
                ToolbarItem(placement: .topBarTrailing) {
                    settingsMenu
                }
            }
        }
    }
    
    // MARK: - Subviews
    
    @ViewBuilder
    private var content: some View {
        ZStack(alignment: .bottom) {
            if viewModel.shouldDisplayPlaceholder {
                placeholderView
                    .frame(maxHeight: .infinity)
            } else {
                listsScrollView
            }
            BaseButton(title: Strings.createList,
                       action: {
                print("CreatingNewList")
                isCreatingNewList = true
            })
            .padding(.horizontal, 16)
            .padding(.bottom, 20)
        }
    }
    
    private var placeholderView: some View {
        Text("Placeholder")
    }
    
    private var listsScrollView: some View {
        ScrollView {
            LazyVStack(alignment: .center, spacing: 12) {
                ForEach(viewModel.lists) { list in
                    ListItemView(item: list)
                        .padding(.bottom, bottomPaddingForRow(list: list))
                }
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.top, 12)
        }
    }
    
    private var titleView: some View {
        Text(Strings.title)
            .font(Fonts.semiBold28)
            .foregroundStyle(Color.grey80)
    }
    
    private var settingsMenu: some View {
        Menu("SettingsMenu",
             systemImage: ImageTitles.settingsMenu,
             content: { })
        .tint(Color.grey80)
    }
    
    // MARK: - Private Methods
    
    private func bottomPaddingForRow(list: ListItem) -> CGFloat {
        list.id == viewModel.lists.last?.id ? 56 : 0
    }
    
    // MARK: - Initializer
    
    init(viewModel: ListsViewModel) {
        self.viewModel = viewModel
    }
    
}

// MARK: - Extension - Constants
private extension ListsMainView {
    enum Strings {
        static let title = "Мои Списки"
        static let createList = "Создать список"
    }
    enum ImageTitles {
        static let settingsMenu = "ellipsis.circle"
    }
    enum Fonts {
        static let semiBold28: Font = .system(size: 28,
                                              weight: .semibold)
    }
}

// MARK: - Preview - Data
#Preview("Data") {
    let viewModel = ListsViewModel()
    viewModel.insert(list: .mock)
    viewModel.insert(list: .mock2)
    viewModel.insert(list: .mock3)
    viewModel.insert(list: .mock)
    viewModel.insert(list: .mock2)
    viewModel.insert(list: .mock3)
    viewModel.insert(list: .mock)
    viewModel.insert(list: .mock2)
    viewModel.insert(list: .mock3)
    return ListsMainView(viewModel: viewModel)
}

// MARK: - Preview - Empty
#Preview("Empty") {
    let viewModel = ListsViewModel()
    return ListsMainView(viewModel: viewModel)
}
