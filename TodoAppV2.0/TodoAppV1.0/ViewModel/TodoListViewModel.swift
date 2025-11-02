//
//  TodoListViewModel.swift
//  TodoAppV1.0
//
//  Created by Nafiu Amosa on 15/10/2025.
//


import FirebaseFirestore

class TodoListViewModel: ObservableObject{
    @Published var isAddTaskSheetPresented: Bool = false
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }

    func deleteItem(id: String) {
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
