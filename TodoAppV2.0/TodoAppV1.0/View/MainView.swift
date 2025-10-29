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
    @StateObject private var mainVM = MainViewViewModel()

    var body: some View {
        if mainVM.isLoggedIn, !mainVM.currentUserId.isEmpty {
            NavigationStack {
                VStack(alignment: .leading, spacing: 0) {

                    HStack {
                        TextField("New Todo Title", text: $newTodoTitle)
                        Button("Add") {
                            todoViewModel.createTodo(title: newTodoTitle, category: todoViewModel.selectedCategory)
                            newTodoTitle = ""
                        }
                    }
                    .padding()
                    Divider()
                    List{
    //                    ForEach(todoViewModel.todos){ todo in
    //                        HStack{
    //                            Text(todo.title)
    //
    //                        }
    //                    }
                    }
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
        }else {
            LoginView(login_view_model: LoginViewVM())
        }

    }
}

#Preview {
    AppTabView()
}
