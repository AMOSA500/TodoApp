//
//  CategoryListView.swift
//  TodoAppV1.0
//
//  Created by Nafiu Amosa on 16/10/2025.
//

import SwiftUI

struct CategoryListView: View {
    @EnvironmentObject var viewModel: TodoListViewModel
    @Environment(\.modelContext) private var modelContext
    @State private var newCategory = ""
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 0){
                HStack{
                    TextField("New category", text: $newCategory)
                    Button("Add"){
                        if !newCategory.isEmpty{
                            
                        }
                    }
                }
            }
            
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
