//
//  MainView.swift
//  TodoAppV1.0
//
//  Created by Nafiu Amosa on 16/10/2025.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var todoViewModel: TodoListViewModel
    @State private var newTodoTitle = ""
    @StateObject private var mainVM = MainViewViewModel()

    var body: some View {
        if mainVM.isLoggedIn, !mainVM.currentUserId.isEmpty {
            accountView
        }else {
            LoginView()
        }

    }
    // abstract the view
    @ViewBuilder
    var accountView: some View {
        TabView{
            TodoListView(userId: mainVM.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            CategoryListView()
                .tabItem {
                    Label("Categories", systemImage: "list.bullet")
                }
           
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
            
        }
    }
}

#Preview {
    MainView()
}
