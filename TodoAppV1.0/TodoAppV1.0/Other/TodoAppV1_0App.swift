//
//  TodoAppV1_0App.swift
//  TodoAppV1.0
//
//  Created by Nafiu Amosa on 15/10/2025.
//

import SwiftUI
import SwiftData
import FirebaseCore


@main
struct TodoAppV1_0App: App {
    init() {
        FirebaseApp.configure()
    }
//    @StateObject private var todoViewModel: TodoListViewModel
//    let container: ModelContainer
//    
//    init() {
//        do{
//            container = try ModelContainer(for: TodoItem.self, Category.self)
//            _todoViewModel = StateObject(wrappedValue: TodoListViewModel(modelContext: container.mainContext))
//        }catch{
//            fatalError("Failed to create ModelContainer: \(error)")
//        }
//    }

    var body: some Scene {
        WindowGroup {
            AppTabView()
                //.environmentObject(todoViewModel)
        }
        //.modelContainer(container)
        
    }
}
