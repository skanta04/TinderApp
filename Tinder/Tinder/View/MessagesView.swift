//
//  MessagesView.swift
//  Tinder
//
//  Created by Saishreeya Kantamsetty on 11/26/23.
//

import SwiftUI

struct MessagesView: View {
    @ObservedObject var likedCardsModel: LikedCardsViewModel

    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    Image("tinder")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .padding(.leading, 25)
                    Text("tinder")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color("tinColor"), Color("tinColor2"), Color("tinColor3")]), startPoint: .leading, endPoint: .trailing))
                    Spacer()
                    Image(systemName: "shield.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 23, height: 23)
                        .foregroundColor(.gray)
                        .padding(.trailing, 10)
                    }
                
                Text("New Matches")
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 15)
                    .fontWeight(.bold)
                
                    ScrollView(.horizontal) {
                        HStack(spacing: 25) {
                            ForEach(likedCardsModel.likeCards) { card in
                                VStack {
                                    Image(card.imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 150)
                                        .frame(maxHeight: 200)
                                        .cornerRadius(5)
                                    Text(card.name)
                                        .font(.headline)
                                }
                            }
                        }
                    }
                    .padding(.leading, 15)
                
               
                Spacer()

                
                List {
                    Section {
                        ForEach(Message.data) { message in
                            NavigationLink(destination: ConversationView(message: message)) {
                                HStack {
                                    Image(message.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                    VStack(alignment: .leading) {
                                        Text(message.name)
                                            .font(.title2)
                                            .fontWeight(.bold)
                                        Text(message.message)
                                            .font(.subheadline)
                                            .foregroundColor(Color("darkGray"))
                                            .lineLimit(1)
                                            .truncationMode(.tail)
                                    }
                                    Spacer()
                                }

                            }
                        }
                    } header: {
                        Text("Messages")
                            .font(.title3)
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                            .textCase(nil)
                    }
                }
                .listStyle(GroupedListStyle())
                    
            }
        }
    }

}

#Preview {
    MessagesView(likedCardsModel: LikedCardsViewModel())
}
