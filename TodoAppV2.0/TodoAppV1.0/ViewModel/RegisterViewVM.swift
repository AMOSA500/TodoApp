//
//  RegisterViewVM.swift
//  TodoAppV1.0
//
//  Created by NAFIU AMOSA on 19/10/2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import SwiftUI

class RegisterViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var name = ""
    @Published var isShowAlert: Bool = false
    @Published var messageStatus = ""
    @ObservedObject var validator = validationViewModel()

    
    func register(){
        // Validate registration data
        guard validator.validate(email: email, password: password),
                password.count >= 8 else{
            return
        }
        
        // Register
        Auth.auth().createUser(withEmail: email, password: password, completion: {[weak self] result, error in
            guard let userId = result?.user.uid else{
                print("Error creating user")
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
            .setData(newUser.asDictionary())
        
        print("User registered successfully line 49")
        print(isShowAlert)
        isShowAlert.toggle()
        
    }
    
 
}
