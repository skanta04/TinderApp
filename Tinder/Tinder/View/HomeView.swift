//
//  HomeView.swift
//  Tinder
//
//  Created by Saishreeya Kantamsetty on 11/26/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                //header
                HStack {
                    HStack {
                        Image("tinder")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 34, height: 34)
                            
                        Text("tinder")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color("tinColor"))
                            
                    }
                    Spacer()
                    Image(systemName: "bell.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.gray)
                        .padding(.trailing, 20)
                    NavigationLink(destination: SettingsView()) {
                        Image(systemName: "slider.horizontal.3")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.gray)
                    }
                    
                }
                .padding(.horizontal)
                Spacer()
                
                //card
                ZStack {
                    ForEach(Card.data) { card in
                        CardView(card: card)
                            .padding(8)
                    }
                }
                
            }
        }
    }
}

#Preview {
    HomeView()
}
