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


struct TodoItem: Codable, Identifiable {
    var id: String
    var title: String
    var isCompleted: Bool
    var createdAt: TimeInterval
    var dueDate: TimeInterval
    
    mutating func toggleCompleted(_ state: Bool) {
        isCompleted = state
    }
    
   
}
