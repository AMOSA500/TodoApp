//
//  LoginView.swift
//  TodoAppV1.0
//
//  Created by NAFIU AMOSA on 19/10/2025.
//

import SwiftUI


struct LoginView: View{
    @StateObject var viewModel: validationViewModel = validationViewModel()
    @State var email = ""
    @State var password = ""
    @StateObject var login_view_model: LoginViewVM
    
    var body: some View{
        NavigationView{
        VStack{
            // Header
            HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15, bg: .red)
            
            // Login Form
            Form{
                // Display section
                HStack{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(
                                viewModel
                                    .isEmailValid(
                                        email: email
                                    ) ? Color.green : Color.red
                            )
                    }
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                
                
                TextField("Email Address", text: $email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                    .onChange(of: email, {
                        if viewModel.isEmailValid(email: email){
                            viewModel.errorMessage = "✅ Valid email"
                        }else if email.isEmpty{
                            viewModel.errorMessage = ""
                        }
                        else{
                            viewModel.errorMessage = "❌ Invalid email"
                        }
                    })
                
                SecureField("Password", text: $password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                AuthButton(title: "Login", background: .blue,action: {
                    login_view_model.login(email: email, password: password)
                })
            }
            VStack{
                Text("New around here")
                NavigationLink("Create An Account",destination: RegisterView())
            }.padding(.top, 80)
            
            
            Spacer()
        }
    }
    }
}
struct LoginView_Preview: PreviewProvider{
    static var previews: some View{
        LoginView(login_view_model: LoginViewVM())
    }
}
