//
//  AppTabView.swift
//  TodoAppV1.0
//
//  Created by Nafiu Amosa on 16/10/2025.
//

import SwiftUI
import SwiftData

struct AppTabView: View { // Renamed to avoid confusion with the SwiftUI type
//    @StateObject private var todoViewModel: TodoListViewModel
//    @Environment(\.modelContext) private var modelContext

    
//    init() {
//        _todoViewModel = try! StateObject(wrappedValue: TodoListViewModel(modelContext: ModelContext(ModelContainer(for: TodoItem.self, Category.self))))
//    }
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Label("Todos", systemImage: "checklist")
                }
            
            CategoryListView()
                .tabItem {
                    Label("Categories", systemImage: "folder")
                }
        }
    }
}

#Preview {
    AppTabView()
}
