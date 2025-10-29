//
//  MainViewVM.swift
//  TodoAppV1.0
//
//  Created by NAFIU AMOSA on 19/10/2025.
//

import Foundation
import FirebaseAuth
class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    
    private var handler: AuthStateDidChangeListenerHandle?
    init(){
        self.handler = Auth.auth().addStateDidChangeListener({ (auth, _) in
            DispatchQueue.main.async {
                if let user = auth.currentUser {
                    self.currentUserId = user.uid
                } else {
                    self.currentUserId = ""
                }
            }
            
        })
    }
    
    public var isLoggedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
