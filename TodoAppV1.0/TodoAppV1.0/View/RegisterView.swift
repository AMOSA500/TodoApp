//
//  RegisterView.swift
//  TodoAppV1.0
//
//  Created by NAFIU AMOSA on 19/10/2025.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack{
            HeaderView(title: "Register", subtitle: "Start organising todos", angle: -15, bg: .black)
        }
            
            // Form
            Form{
                TextField("Your Name", text: $name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Your Email", text: $email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                
                SecureField("Create Password", text: $password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
            // Register Button
            AuthButton(title: "Create account", background: .green, action: {
   
                })

            }.scrollContentBackground(.hidden)
            

        
        Spacer()
    }
}

#Preview {
    RegisterView()
}
