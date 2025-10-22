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
          
                Text(login_view_model.errorMessage)
                        .foregroundColor(Color.red)
                
                
                TextField("Email Address", text: $login_view_model.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                
                TextField("Password", text: $login_view_model.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                AuthButton(title: "Login", background: .blue,action: {
                    // action
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
