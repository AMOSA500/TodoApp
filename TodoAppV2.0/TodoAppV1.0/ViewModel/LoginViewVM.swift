//
//  LoginViewVM.swift
//  TodoAppV1.0
//
//  Created by NAFIU AMOSA on 19/10/2025.
//

import Foundation
import FirebaseAuth
import SwiftUI

class LoginViewVM: ObservableObject{
    @StateObject private var validator = validationViewModel()
    
    func login(email: String, password: String){
        guard validator.validate(email: email, password: password) else{
            print("Validation Error")
            return
        }
        
        // login with firebase
    }
    
    
}
