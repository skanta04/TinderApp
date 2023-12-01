//
//  ConversationViewModel.swift
//  Tinder
//
//  Created by Saishreeya Kantamsetty on 11/29/23.
//

import Foundation

class ConversationViewModel: ObservableObject {
    @Published var messages: [String] = []
    
    func sendMessage(_ message: String) {
        messages.append(message)
    }
}


