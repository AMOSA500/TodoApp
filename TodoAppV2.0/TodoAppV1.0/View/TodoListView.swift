//
//  TodoListView.swift
//  TodoAppV1.0
//
//  Created by Nafiu Amosa on 30/10/2025.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct TodoListView: View {
    @StateObject var todolistViewModel: TodoListViewModel
    @State var isShowAlert: Bool = false
    @State var parsedUserId: String = ""
    @FirestoreQuery var items: [TodoItem]
    
    init (userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._todolistViewModel = StateObject(
            wrappedValue: TodoListViewModel(userId: userId)
        )
    }
    var body: some View {
        NavigationView{
            VStack{
                List(items){ item in
                    TodoListItemView(item: item)
                        .swipeActions(edge: .trailing){
                            HStack{
                                Button(action: {
                                    //todolistViewModel.isAddTaskSheetPresented = true
                                }) {
                                    Text("Edit")
                                }.tint(.blue)
                                Button(
                                    action: {
                                        //todolistViewModel.isAddTaskSheetPresented = true
                                        isShowAlert = true
                                        parsedUserId = item.id
                                    }) {
                                        Text("Delete")
                                    }.tint(.red)
                            }
                        }
                }.listStyle(PlainListStyle())
                    .scrollContentBackground(.hidden)
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
            .alert("Are You Sure To Delete?",isPresented: $isShowAlert){
                Button("Cancel", role: .cancel){
                    isShowAlert = false
                }
                Button("Delete", role: .destructive){
                    todolistViewModel.deleteItem(id: parsedUserId)
                }
            }message: {
                Text("Are you sure you want to delete this item?")
            }
            
        }
    }
}

#Preview {
    let userId = Auth.auth().currentUser?.uid ?? "NsPn463HafSYHoHd8DmFYSdkVvD2"
    TodoListView(userId: userId)
}
