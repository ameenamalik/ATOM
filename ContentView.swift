//
//  ContentView.swift
//  ATOM
//
//  Created by Ameena Malik on 2024-02-11.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    
    @State private var profiles = [
            ProfileView(name: "Alex", bio: "Loves music and hiking", image: "profile1"),
            ProfileView(name: "Sam", bio: "Enjoys painting and biking", image: "profile2"),
            ProfileView(name: "Jordan", bio: "Fan of movies and coffee", image: "profile3")
        ]
        
        @State private var offset: CGSize = .zero
        
    @AppStorage("isUserLoggedIn") var isUserLoggedIn: Bool = false

    var body: some View {
        if isUserLoggedIn {
            // Navigate to the main app view
            MainTabView()
        } else {
            // Show the login view
            LoginView(isUserLoggedIn: $isUserLoggedIn)
        }
    }
}

// This is the main view of the app after logging in, now containing the TabView.
struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            ForumView()
                .tabItem {
                    Label("Forums", systemImage: "person.3")
                }

            MessagesView()
                .tabItem {
                    Label("Messages", systemImage: "message")
                }

            ProfilesView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
        }
        .accentColor(.purple) // Adjust for your theme
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
