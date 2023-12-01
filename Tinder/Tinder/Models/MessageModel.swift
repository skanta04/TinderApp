//
//  MessageModel.swift
//  Tinder
//
//  Created by Saishreeya Kantamsetty on 11/27/23.
//

import Foundation

struct Message: Identifiable {
    let id = UUID()
    let image: String
    let name: String
    let message: String
    
    static var data: [Message] {
        [
            Message(image: "ellie", name: "Ellie", message: "what's cookin' good lookin'"),
            Message(image: "sruthy", name: "Sruthy", message: "hey shawty what's up"),
            Message(image: "Colby", name: "Colby", message: "hey hey whats up"),
            Message(image: "justin", name: "Justin", message: "lunch tmrow?"),
            Message(image: "milan", name: "Milan", message: "wow! I love word hunt too!"),
            Message(image: "ethan", name: "Ethan", message: "how's your day going so far?"),
            Message(image: "william", name: "William", message: "if you could teleport anywhere right now, where would it be?")
            
        ]
    }
}


