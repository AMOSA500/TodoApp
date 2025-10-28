//
//  RegisterViewVM.swift
//  TodoAppV1.0
//
//  Created by NAFIU AMOSA on 19/10/2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var name = ""
    var validateEmail = LoginViewVM()
    
    
    func register(){
        guard validate() else{
            return
        }
        
        // Register
        Auth.auth().createUser(withEmail: email, password: password, completion: {[weak self] result, error in
            guard let userId = result?.user.uid else{
                return
            }
            
            self?.insertUserRecord(id: userId)
            
        })
        
        
    }
    // Insert record
    private func insertUserRecord(id: String){
        let newUser = User( id: id,
                           name: name,
                           email: email,
                           joined: Date().timeIntervalSince1970
        )
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
        
        
    }
    // Validate all field
    private func validate() -> Bool{
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        
        // validate email
        guard validateEmail.isEmailValid else{
            return false
        }
        
        // password length
        guard password.count >= 8 else{
            return false
        }
        return true
    }
}
