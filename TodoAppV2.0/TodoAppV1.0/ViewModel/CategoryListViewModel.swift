//
//  CategoryListViewModel.swift
//  TodoAppV1.0
//
//  Created by Nafiu Amosa on 30/10/2025.
//

import Foundation
import SwiftUI

class CategoryListViewModel: ObservableObject {
    @Environment(\.modelContext) var modelContext
    @Published var categories: [Category] = []
    @Published var isShowAlert: Bool = false

    
    init() {
        self.categories = [
//            Category(name: "Work", todos: todos)),
//            Category(todos: <#[TodoItem]#>, name: "Personal"),
//            Category(todos: <#[TodoItem]#>, name: "Health")
            ]
    }
}
