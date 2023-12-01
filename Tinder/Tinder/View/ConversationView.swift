//
//  ConversationView.swift
//  Tinder
//
//  Created by Saishreeya Kantamsetty on 11/27/23.
//

import SwiftUI

struct ConversationView: View {
    var message: Message
    @State private var inputMessage = ""
    @ObservedObject private var viewModel = ConversationViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                Text("YOU MATCHED WITH \(message.name) ON 11/26/23")
                    .font(.caption)
                    .foregroundColor(Color("darkGray"))
                    .padding(.top, 25)
                
                OtherMessage(message: message.message, mes: message)
                ScrollView {
                    ForEach(viewModel.messages, id: \.self) { mes in
                        MessageBubble(message: mes)
                    }
                }
                .padding(10)
                Spacer()
                
                
            }
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                        VStack {
                            Image(message.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                            Text(message.name)
                                .font(.subheadline)
                        }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button(action: {}, label: {
                            Image(systemName: "video.fill")
                                .foregroundColor(.blue)
                        })
                        Button(action: {}, label: {
                            Image(systemName: "shield.fill")
                                .foregroundColor(.blue)
                        })
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        TextField("Type a message", text: $inputMessage)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)

                    Button(action: messageSend) {
                        Text("Send")
                            .padding(7)
                            .background(Color.clear)
                            .foregroundColor(Color("darkGray"))
                            .cornerRadius(7)

                        }
                    }
                }
            })
        }
    }
    
    func messageSend() {
        if !inputMessage.isEmpty {
            viewModel.sendMessage(inputMessage)
            inputMessage = ""
        }
    }
}

struct MessageBubble: View {
    var message: String

    var body: some View {
        HStack {
            Spacer()
            Text(message)
                .padding(7)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            
        }
        .padding(.vertical, 5)
    }
}

struct OtherMessage: View {
    var message: String
    var mes: Message
    var body: some View {
        HStack {
            Image(mes.image)
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .padding(.leading, 10)
            Text(message)
                .padding(7)
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            Spacer()
            Image(systemName: "heart.fill")
                .foregroundColor(.red)
            
        }
        .padding(.vertical, 5)
    }
}

#Preview {
    ConversationView(message: Message(image: "ellie", name: "ellie", message: "amazing"))
}
