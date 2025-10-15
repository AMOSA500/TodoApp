//
//  TodoListViewModel.swift
//  TodoAppV1.0
//
//  Created by Nafiu Amosa on 15/10/2025.
//

import Foundation

class TodoListViewModel: ObservableObject{
    @Published var todo: [Todo] = []
}
