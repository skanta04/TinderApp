//
//  ContentView.swift
//  Tinder
//
//  Created by Saishreeya Kantamsetty on 11/26/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var likedCardsModel: LikedCardsViewModel = LikedCardsViewModel()
    var body: some View {
        TabView() {
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                }
            HomeView(likedCardsModel: likedCardsModel)
                .tabItem {
                    Image(systemName: "flame.fill")
                }
            MessagesView(likedCardsModel: likedCardsModel)
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
