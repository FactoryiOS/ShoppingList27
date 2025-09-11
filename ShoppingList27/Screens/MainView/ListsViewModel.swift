//
//  ListsViewModel.swift
//  ShoppingList27
//
//  Created by Vladimir on 11.09.2025.
//

import SwiftUI

final class ListsViewModel: ObservableObject {
    
    @Published private(set) var lists: [ListItem] = []
    
    var shouldDisplayPlaceholder: Bool {
        lists.isEmpty
    }
    
    func insert(list: ListItem) {
        lists.append(list)
    }
    
}
