//
//  RegisterView.swift
//  TodoAppV1.0
//
//  Created by NAFIU AMOSA on 19/10/2025.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    @StateObject var validateVModel: validationViewModel = validationViewModel()

    var body: some View {
        VStack{
            HeaderView(title: "Register", subtitle: "Start organising todos", angle: -15, bg: .black)
        }
            
            // Form
            Form{
                HStack{
                    if !validateVModel.errorMessage.isEmpty{
                        Text(validateVModel.errorMessage)
                            .foregroundColor(
                                validateVModel
                                    .isEmailValid(
                                        email: viewModel.email
                                    ) ? Color.green : Color.red
                            )
                    }
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                TextField("Your Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Your Email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                    .onChange(of: viewModel.email, {
                        if validateVModel.isEmailValid(email: viewModel.email){
                            validateVModel.errorMessage = "✅ Valid email"
                        }else if viewModel.email.isEmpty{
                            validateVModel.errorMessage = ""
                        }
                        else{
                            validateVModel.errorMessage = "❌ Invalid email"
                        }
                    })
                
                SecureField("Create Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
            // Register Button
            AuthButton(title: "Create account", background: .green, action: {
                viewModel.register()
            })

            }.scrollContentBackground(.hidden)
            
        Spacer()
    }
}

#Preview {
    RegisterView()
}
