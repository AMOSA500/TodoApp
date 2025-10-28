//
//  LoginView.swift
//  TodoAppV1.0
//
//  Created by NAFIU AMOSA on 19/10/2025.
//

import SwiftUI


struct LoginView: View{
    @StateObject var login_view_model = LoginViewVM()
    var body: some View{
        NavigationView{
        VStack{
            // Header
            HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15, bg: .red)
            
            
            
            // Login Form
            Form{
                // Display section
                HStack{
                    if !login_view_model.errorMessage.isEmpty{
                        Text(login_view_model.errorMessage)
                            .foregroundColor(login_view_model.isEmailValid ? Color.green : Color.red)
                    }
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                
                
                TextField("Email Address", text: $login_view_model.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                    .onChange(of: login_view_model.email, {
                        if login_view_model.isEmailValid{
                            login_view_model.errorMessage = "✅ Valid email"
                        }else{
                            login_view_model.errorMessage = "❌ Invalid email"
                        }
                    })
                
                SecureField("Password", text: $login_view_model.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                AuthButton(title: "Login", background: .blue,action: {
                    login_view_model.login()
                })
            }
            VStack{
                Text("New around here")
                NavigationLink("Create An Account",destination: RegisterView())
            }.padding(.bottom, 80)
            
            
            Spacer()
        }
    }
    }
}
struct LoginView_Preview: PreviewProvider{
    static var previews: some View{
        LoginView()
    }
}
