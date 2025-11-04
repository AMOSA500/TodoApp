//
//  ProfileViewModel.swift
//  TodoAppV1.0
//
//  Created by NAFIU AMOSA on 19/10/2025.
//

import FirebaseFirestore
import FirebaseAuth
import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var user: User?
    @Published var showError: Bool = false
    @Published var error: String = ""
    init(){
        
    }
    
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument {
            [weak self] document,
            error in
            guard let data = document?.data(),
                  error == nil else { return }
            
            DispatchQueue.main.async {
                self?.user = User(
                    id: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    joined: data["joined"] as? TimeInterval ?? 0
                    
                )
            }
        }
        
    }
    
    func logout() {
        do{
            try Auth.auth().signOut()
        }catch {
            showError = true
            self.error = error.localizedDescription.description
        }
        
    }
    
    
    
}
