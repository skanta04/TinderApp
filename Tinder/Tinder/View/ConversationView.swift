//
//  ConversationView.swift
//  Tinder
//
//  Created by Saishreeya Kantamsetty on 11/27/23.
//

import SwiftUI

struct ConversationView: View {
    var message: Message
    var body: some View {
        NavigationStack {
            VStack {
                
            }
            .toolbar(content: {
                ToolbarItem(placement: .principal) {
                    ZStack {
                        
                        VStack {
                            Image(message.image)
                                .resizable()
                                .frame(width: 40, height: 40)
                                .cornerRadius(100)
                            Text(message.name)

                        }
                    }
                        
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Image(systemName: "video.fill")
                            .foregroundColor(.gray)
                        Image(systemName: "shield.fill")
                            .foregroundColor(.gray)
                    }
                }
            })
        }
    }
}

#Preview {
    ConversationView(message: Message(image: "ellie", name: "ellie", message: "amazing"))
}
