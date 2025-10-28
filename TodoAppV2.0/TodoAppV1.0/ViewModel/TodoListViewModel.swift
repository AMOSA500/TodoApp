//
//  TodoListViewModel.swift
//  TodoAppV1.0
//
//  Created by Nafiu Amosa on 15/10/2025.
//

import Foundation
import SwiftData
import SwiftUI

class TodoListViewModel: ObservableObject{
    @Published var selectedCategory: Category?
    @Published var todos: [TodoItem] = []
    @Published var category: [Category] = []
    
    private var modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
 
    func createTodo(title: String, category: Category?) {
        let newTodo = TodoItem(title: title)
        modelContext.insert(newTodo)
        todos.append(newTodo)
        

    }
    
    func addCategory(name: String) {
    
    }
    

    func deleteItems(offsets: IndexSet) {
            for index in offsets {
                modelContext.delete(todos[index])
            }
    }
}
