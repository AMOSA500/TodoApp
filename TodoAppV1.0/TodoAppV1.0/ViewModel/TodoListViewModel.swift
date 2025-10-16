//
//  TodoListViewModel.swift
//  TodoAppV1.0
//
//  Created by Nafiu Amosa on 15/10/2025.
//

import Foundation
import SwiftData
import SwiftUICore

class TodoListViewModel: ObservableObject{
    @Environment(\.modelContext) private var modelContext
    @Published var todo: [TodoItem] = []
    
    func addTodoItem(title: String) {
//            let newItem = TodoItem(timestamp: Date())
//            modelContext.insert(newItem)

    }

    func deleteItems(offsets: IndexSet) {
            for index in offsets {
                modelContext.delete(todo[index])
            }
    }
}
