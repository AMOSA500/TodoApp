//
//  AlertViewModel.swift
//  TodoAppV1.0
//
//  Created by Nafiu Amosa on 01/11/2025.
//

import SwiftUI

struct AlertViewModel: ViewModifier {
    var alert_title: String
    var alert_message: String
    @Binding var isSetAlert: Bool
 
    func body(content: Content) -> some View {
        ZStack {
            content
                .alert(alert_title, isPresented: $isSetAlert){
                    Button("OK", role: .cancel){}
                        
                    }message:{
                        Text(alert_message)
                    }
                
        }
    }
}
extension View {
    func resuableAlert(alert_title: String, alert_message: String, isSetAlert: Binding<Bool>) -> some View {
        modifier(AlertViewModel(alert_title: alert_title, alert_message: alert_message, isSetAlert: isSetAlert))
    }
}


