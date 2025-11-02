//
//  TodoListView.swift
//  TodoAppV1.0
//
//  Created by Nafiu Amosa on 30/10/2025.
//

import SwiftUI
import FirebaseFirestore

struct TodoListView: View {
    @StateObject var todolistViewModel: TodoListViewModel = TodoListViewModel()
    @FirestoreQuery var items: [TodoItem]
    
    init (userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
    }
    var body: some View {
        NavigationView{
            VStack{
                List(items){ item in
                    VStack(alignment: .leading){
                        Text(item.title).font(.title)
                        Text(
                            Date(timeIntervalSince1970: item.dueDate)
                                .formatted(date: .abbreviated, time: .shortened)
                        ).font(.footnote).foregroundColor(.secondary)
                        
                        Spacer()
                        Button{
                            
                        }label: {
                            Label("", image: item.isCompleted ? "checkmark.square.fill" : "checkmark.square")
                        }
                        
                    }
                    
                }
            }
            .navigationTitle("Todo List")
            .toolbar {
                Button{
                    todolistViewModel.isAddTaskSheetPresented = true
                }label:{
                    Label("Add", systemImage: "plus")
                }
            }.sheet(isPresented: $todolistViewModel.isAddTaskSheetPresented){
                AddNewTodoView(
                    isNewItemPresented: $todolistViewModel.isAddTaskSheetPresented
                )
            }
            
        }
    }
}

#Preview {
    TodoListView(userId: "NsPn463HafSYHoHd8DmFYSdkVvD2")
}
