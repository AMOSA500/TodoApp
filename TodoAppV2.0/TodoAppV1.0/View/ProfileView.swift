//
//  ProfileView.swift
//  TodoAppV1.0
//
//  Created by NAFIU AMOSA on 19/10/2025.
//

import SwiftUI
import FirebaseFirestore

struct ProfileView: View {
    @StateObject var profileViewModel = ProfileViewModel()
    
    var body: some View {
        NavigationView{
            if let user = profileViewModel.user {
                profile(user: user)
                
            }else {
                Text("No user found")
            }
                
        }.onAppear(){
            profileViewModel.fetchUser()
        }
        .navigationTitle("")
    }
    
    @ViewBuilder
    func profile(user: User) -> some View{
        VStack{
            Image(systemName: "person.crop.circle")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .clipShape(Circle())
                .padding(.vertical, 20)
            
            
            HStack{
                Text("Name: ").bold()
                Text(user.name).bold()
            }.padding()
            HStack{
                Text("Email: ")
                Text(user.email)
            }.padding()
            HStack{
                Text("Member Since: ")
                Text(
                    Date(timeIntervalSince1970: user.joined)
                        .formatted(date: .abbreviated, time: .shortened)
                )
            }.padding()
            
            Spacer()
            HStack{
                AuthButton(
                    title: "Sign Out",
                    background: .white,
                    foreground: .red,
                    action: {
                        profileViewModel.logout()
                    })
            }.frame(maxWidth: .infinity, maxHeight: 120).padding()
            
        }
        // if logout error occur
        .alert("Profile Error", isPresented: $profileViewModel.showError) {
            Button("OK", role: .cancel) {
                
            }
        }message: {
            Text(profileViewModel.error)
        }
    }
}

#Preview {
    NavigationView{
        ProfileView()
    }
}
