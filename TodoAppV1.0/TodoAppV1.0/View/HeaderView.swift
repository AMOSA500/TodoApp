//
//  HeaderView.swift
//  TodoAppV1.0
//
//  Created by NAFIU AMOSA on 19/10/2025.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(Color.red)
                .rotationEffect(Angle(degrees: 15))
            
            VStack{
                Text("To Do List")
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                
                Text("Get thigns done")
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
            } .padding(.top, 30)
        }.frame(width: UIScreen.main.bounds.width * 3, height: 300)
            .offset(y: -100)
    }
}

#Preview {
    HeaderView()
}
