//
//  LoginViewVM.swift
//  TodoAppV1.0
//
//  Created by NAFIU AMOSA on 19/10/2025.
//

import Foundation
import FirebaseAuth

class LoginViewVM: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(email: String = "", password: String = "") {
        self.email = email
        self.password = password
    }
    
    var isEmailValid: Bool{
        let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailPattern)
        return predicate.evaluate(with: email)
    }
    
    func login(){
        guard validate() else{
            return
        }
        
        // login with firebase
    }
    
    private func validate() -> Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "All fields are required."
            return false
        }
        guard isEmailValid else {
            return false
        }
        return true
        
        // validate email
    }
    
}
