//
//  LoginView.swift
//  TodoAppV1.0
//
//  Created by NAFIU AMOSA on 19/10/2025.
//

import SwiftUI


struct LoginView: View{
    @State var email = ""
    @State var password = ""
    var body: some View{
        VStack{
            // Header
            HeaderView()
            
            // Login Form
            Form{
                TextField("Email Address", text: $email).textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button{
                    // Login Attempt
                }label:{
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.blue)
                        Text("Login")
                            .foregroundColor(Color.white)
                            .bold()
                            .padding(10)
                    }.padding(.top, 30)
                }
            }
            VStack{
                Text("New around here")
                Button("Create An Account"){
                    //RegisterView()
                }
            }
            
            
            Spacer()
        }
    }
}
struct LoginView_Preview: PreviewProvider{
    static var previews: some View{
        LoginView()
    }
}
