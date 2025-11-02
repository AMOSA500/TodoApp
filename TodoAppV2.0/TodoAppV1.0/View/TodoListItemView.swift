//
//  TodoListItemView.swift
//  TodoAppV1.0
//
//  Created by Nafiu Amosa on 02/11/2025.
//

import SwiftUI

struct TodoListItemView: View {
    @StateObject var userProfile: ProfileViewModel = ProfileViewModel()
    let item: TodoItem
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title).font(.title2).bold()
                Text(
                    Date(timeIntervalSince1970: item.dueDate)
                        .formatted(date: .abbreviated, time: .shortened)
                ).font(.footnote).foregroundColor(.secondary)
                
                
                
            }
            Spacer()
            Button{
                userProfile.toggleIsCompleted(item: item)
            }label: {
                Label(
                    "",
                    systemImage: item.isCompleted ? "checkmark.circle.fill" : "circle"
                )
            }
            
        }
    }
}

#Preview {
    TodoListItemView(
        item: .init(
            id: "123",
            title: "Mobile Application Development Lab Practical",
            isCompleted: false,
            createdAt: Date().timeIntervalSince1970,
            dueDate: Date().timeIntervalSince1970
        )
    )
}
