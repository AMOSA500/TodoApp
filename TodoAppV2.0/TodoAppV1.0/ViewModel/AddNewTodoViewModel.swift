//
//  AddNewTodoViewModel.swift
//  TodoAppV1.0
//
//  Created by Nafiu Amosa on 30/10/2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AddNewTodoViewModel: ObservableObject {
    @Published var selectedCategory: String = ""
    @Published var title: String = ""
    @Published var dueDate: Date = Date()
    @Published var showAlert: Bool = false
    
    init(){
        
    }
    
    func saveTodo(){
        guard checkValidity else{
            DispatchQueue.main.async {
                self.showAlert.toggle()
            }
            return
        }
        
        // Get current user id
        guard let userId = Auth.auth().currentUser?.uid else{
            return
        }
        
        // Create a model
        let id = UUID().uuidString
        let newTodo = TodoItem(
            id: id,
            title: title,
            isCompleted: false,
            createdAt: Date().timeIntervalSince1970,
            dueDate: dueDate.timeIntervalSince1970
        )
        
        // Save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(userId)
            .setData(newTodo.asDictionary())
        
        print("Todo saved")
        
        
    }
    
    var checkValidity: Bool{
        guard !title
            .trimmingCharacters(in: .whitespaces).isEmpty, dueDate >= Date()
            .addingTimeInterval(-86_400) else{
                return false
            }
        return true
    }
}
