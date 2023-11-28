//
//  ContentView.swift
//  Tinder
//
//  Created by Saishreeya Kantamsetty on 11/26/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView() {
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                }
            HomeView()
                .tabItem {
                    Image(systemName: "flame.fill")
                }
            MessagesView()
                .badge("10")
                .tabItem {
                    Image(systemName: "message.fill").font(.system(size: 50))
                }
        }
    }
}

#Preview {
    ContentView()
}
