//
//  validationViewModel.swift
//  TodoAppV1.0
//
//  Created by Nafiu Amosa on 29/10/2025.
//

import Foundation
import SwiftUI

class validationViewModel: ObservableObject {
    @Published var errorMessage: String = ""
    @State private var email: String = ""
    @Published var isShowAlert: Bool = false
 
    func isEmailValid(email: String) -> Bool{
        let emailPattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", emailPattern)
        return predicate.evaluate(with: email)
    }
    
    public func validate(email: String, password: String) -> Bool{
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty  else{
            errorMessage = "All fields are required."
            isShowAlert = false
            return false
        }
        self.email = email
        guard isEmailValid(email: email) else {
            isShowAlert = false
            errorMessage = "Please enter a valid email."
            return false
        }
        isShowAlert.toggle()
        return true
        
        
    }
    
}
