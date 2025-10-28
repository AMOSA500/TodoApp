//
//  RegisterView.swift
//  TodoAppV1.0
//
//  Created by NAFIU AMOSA on 19/10/2025.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        VStack{
            HeaderView(title: "Register", subtitle: "Start organising todos", angle: -15, bg: .black)
        }
            
            // Form
            Form{
                TextField("Your Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Your Email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                
                SecureField("Create Password", text: $viewModel.password)
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
