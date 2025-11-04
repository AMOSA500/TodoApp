//
//  AddNewTodoView.swift
//  TodoAppV1.0
//
//  Created by Nafiu Amosa on 30/10/2025.
//

import SwiftUI

struct AddNewTodoView: View {
    @StateObject var viewModel: AddNewTodoViewModel = AddNewTodoViewModel()
    @Binding var isNewItemPresented: Bool
    
    var body: some View {
        VStack{
            Text("New List").font(.system(size: 24).bold()).padding(20)
            Form{
                // Category
                Picker("Category", selection: $viewModel.selectedCategory){
                    Text("One").tag("One")
                    Text("Two").tag("Two")
                    Text("Three").tag("Three")
                }
                // Name
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // Due date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                // Button
                AuthButton(title: "Save", background: .red, foreground: .white){
                    if viewModel.checkValidity{
                        viewModel.saveTodo()
                        isNewItemPresented = false
                    }else{
                        viewModel.showAlert = true
                    }
                    
                    
                    
                }
            }
            // Todo add alert view here
            .resuableAlert(
                alert_title: "Error",
                alert_message: "Please fill all the fields",
                isSetAlert: $viewModel.showAlert)
            
        }
    }
}

#Preview {
    AddNewTodoView(isNewItemPresented: Binding(get: {
        return true
    }, set: { Value in
        
    }) )
}
