//
//  AuthButton.swift
//  TodoAppV1.0
//
//  Created by NAFIU AMOSA on 21/10/2025.
//

import SwiftUI

struct AuthButton: View {
    let title: String
    let background: Color
    var action: () -> ()
    @StateObject var viewModel: validationViewModel = validationViewModel()

    
    var body: some View {
        Button{
          action()
        }label:{
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
                    .padding(10)
            }.padding(.vertical, 30)
        }
        .alert("Message alert", isPresented: $viewModel.isShowAlert){
            Button("Ok", role: .cancel){}
        }message:{
            Text(viewModel.errorMessage)
        }
    }
}

#Preview {
    AuthButton(title: "Default", background: .blue, action: {
        //
    })
}
