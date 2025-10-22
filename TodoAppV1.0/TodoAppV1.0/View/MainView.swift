//
//  MainView.swift
//  TodoAppV1.0
//
//  Created by Nafiu Amosa on 16/10/2025.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var todoViewModel: TodoListViewModel
    @State private var newTodoTitle = ""

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 0) {

                HStack {
                    TextField("New Todo Title", text: $newTodoTitle)
                    Button("Add") {
//                        todoViewModel.createTodo(title: newTodoTitle, category: <#T##Category?#>)
//                        newTodoTitle = ""
                    }
                }
                .padding()
                Divider()
//                List{
//                    ForEach(todoViewModel.todos){ todo in
//                        HStack{
//                            Text(todo.title)
//                            
//                        }
//                    }
//                }
                Spacer()

                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("✍️ Todo List").font(.title2).fontWeight(.bold)
                        }
                    }.toolbarBackground(Color.black, for: .navigationBar)
                    .toolbarBackground(.visible, for: .navigationBar)
                    .toolbarColorScheme(.dark, for: .navigationBar)
                    .toolbarTitleDisplayMode(.inline)

            }//.background(Color(.systemGray6))

        }

    }
}

#Preview {
    AppTabView()
        //.environmentObject(TodoListViewModel(modelContext: <#ModelContext#>))
}
