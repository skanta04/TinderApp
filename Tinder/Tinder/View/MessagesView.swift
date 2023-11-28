//
//  MessagesView.swift
//  Tinder
//
//  Created by Saishreeya Kantamsetty on 11/26/23.
//

import SwiftUI

struct MessagesView: View {
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
                        .foregroundColor(Color("tinColor"))
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
                Spacer()
                Text("Messages")
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 15)
                    .fontWeight(.bold)
                
                List {
                    Section {
                        ForEach(Message.data) { message in
                            NavigationLink(destination: ConversationView(message: message)) {
                                HStack {
                                    Image(message.image)
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .cornerRadius(100)
                                    VStack(alignment: .leading) {
                                        Text(message.name)
                                            .font(.title2)
                                            .fontWeight(.bold)
                                        Text(message.message)
                                            .font(.title3)
                                            .foregroundColor(.gray)
                                            .lineLimit(1)
                                            .truncationMode(.tail)
                                    }
                                    Spacer()
                                }

                            }
                        }
                    }
                }
                    
            }
        }
    }
}

#Preview {
    MessagesView()
}
