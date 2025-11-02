//
//  TodoAppV1_0App.swift
//  TodoAppV1.0
//
//  Created by Nafiu Amosa on 15/10/2025.
//

import SwiftUI
import SwiftData
import FirebaseCore


@main
struct TodoAppV1_0App: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            MainView()
                //.environmentObject(todoViewModel)
        }
        //.modelContainer(container)
        
    }
}
