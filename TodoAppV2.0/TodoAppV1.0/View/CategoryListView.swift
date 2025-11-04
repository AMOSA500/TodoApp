//
//  CategoryListView.swift
//  TodoAppV1.0
//
//  Created by Nafiu Amosa on 16/10/2025.
//

import SwiftUI

struct CategoryListView: View {
    @StateObject var viewModel: CategoryListViewModel = CategoryListViewModel()
    @Environment(\.modelContext) private var modelContext
    @State private var newCategory = ""
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 0){
                    Form{
                        TextField("Add New Category", text: $newCategory)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .padding()
                        
                        AuthButton(title: "Add", background: .red, foreground: .white, action: {
                            if newCategory.isEmpty{
                                viewModel.isShowAlert = true
                            }
                            
                        })
                    }.frame(maxWidth: .infinity, maxHeight: 280)
                
                     
                
                
                VStack{
                    HStack{
                        Text("List of Categories")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Color.gray)     
                    }
                    Divider()
                        
                }.padding(20)
                Spacer()
                
                
               
                
            }
            .resuableAlert(
                alert_title: "Error with Category",
                alert_message: "Please enter a category name to add",
                isSetAlert: $viewModel.isShowAlert
            )
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("✍️ Category List").font(.title2).fontWeight(.bold)
                }
            }.toolbarBackground(Color.black, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    CategoryListView()
}
