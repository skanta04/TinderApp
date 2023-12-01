//
//  HomeView.swift
//  Tinder
//
//  Created by Saishreeya Kantamsetty on 11/26/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var likedCardsModel: LikedCardsViewModel
    @State private var cards: [Card] = Card.data
    
    var body: some View {
        NavigationStack {
            VStack {
                
                HStack {
                    HStack {
                        Image("tinder")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 34, height: 34)
                            
                        Text("tinder")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color("tinColor"), Color("tinColor2"), Color("tinColor3")]), startPoint: .leading, endPoint: .trailing))
                    }
                    Spacer()
                        Image(systemName: "bell.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.gray)
                            .padding(.trailing, 20)
                    
                    
                    NavigationLink(destination: SettingsView())  {
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
                    
                    ForEach($cards) { $card in
                            CardView(card: $card, likedCardsModel: likedCardsModel)
                            .padding([.horizontal])
                            .padding(.bottom, 20)
                        
                    }
                }
                
            }
        }
    }
}

#Preview {
    HomeView(likedCardsModel: LikedCardsViewModel())
}
