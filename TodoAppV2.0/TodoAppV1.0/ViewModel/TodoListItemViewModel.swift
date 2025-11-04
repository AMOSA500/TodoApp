//
//  TodoListItemViewModel.swift
//  TodoAppV1.0
//
//  Created by Nafiu Amosa on 02/11/2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class TodoListItemViewModel: ObservableObject {
    
    func toggleIsCompleted(item: TodoItem) {
        var itemCopy = item
        itemCopy.toggleCompleted(!item.isCompleted) // If use
        
        // Get User id
        guard let userId = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(item.id) // Call itemCopy here dot id
            .updateData(["isCompleted": !item.isCompleted]) // Then setData of itemCopy.asDictionary
    }
}

