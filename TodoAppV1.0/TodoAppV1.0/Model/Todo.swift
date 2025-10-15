//
//  Todo.swift
//  TodoAppV1.0
//
//  Created by Nafiu Amosa on 15/10/2025.
//

import Foundation
import SwiftData

@Model
final class Category {
    var name: String
    @Relationship(deleteRule: .cascade) var todos: [TodoItem]
    
    init(name: String, todos: [TodoItem]) {
        self.name = name
        self.todos = todos
    }
}

@Model
final class TodoItem{
    var title: String
    var isCompleted: Bool
    var createdAt: Date
    var category: Category?
    
    init(title: String, isCompleted: Bool, createdAt: Date, category: Category? = nil) {
        self.title = title
        self.isCompleted = isCompleted
        self.createdAt = createdAt
        self.category = category
    }
}
