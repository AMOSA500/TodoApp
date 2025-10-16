//
//  AppTabView.swift
//  TodoAppV1.0
//
//  Created by Nafiu Amosa on 16/10/2025.
//

import SwiftUI

struct AppTabView: View { // Renamed to avoid confusion with the SwiftUI type
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Label("Todos", systemImage: "checklist")
                }
            
            CategoryListView()
                .tabItem {
                    Label("Categories", systemImage: "folder")
                }
        }
    }
}

#Preview {
    AppTabView()
}
