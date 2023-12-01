//
//  CardModel.swift
//  Tinder
//
//  Created by Saishreeya Kantamsetty on 11/26/23.
//

import Foundation

struct Card: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let bio: String
    let age: Int
    let interests: [String]
    
    var x: CGFloat = 0.0
    var y: CGFloat = 0.0
    var degree: Double = 0.0
    
    static var data: [Card] {
        [
            Card(name: "Srikar", imageName: "srikar", bio: "dog lover, coffee addict, looking for good vibes.", age: 19, interests: ["Concerts", "Icecream", "Coffee"]),
            Card(name: "Ellie", imageName: "ellie", bio: "bad at bios, swipe right to help?", age: 19, interests: ["Concerts", "Icecream", "Coffee"]),
            Card(name: "Sruthy", imageName: "sruthy", bio: "send me sunset pics :)", age: 19, interests: ["Concerts", "Icecream", "Coffee"]),
            Card(name: "Colby", imageName: "Colby", bio: "strong independent man", age: 20, interests: ["Concerts", "Icecream", "Coffee"]),
            Card(name: "Ethan", imageName: "ethan", bio: "fluent in sarcasm and movie quotes", age: 21, interests: ["Concerts", "Icecream", "Coffee"]),
            Card(name: "Lauren", imageName: "lauren", bio: "seeking adventure and chaos", age: 19, interests: ["Concerts", "Icecream", "Coffee"]),
            Card(name: "Zab", imageName: "zab", bio: "swipe right if you can make me laugh", age: 19, interests: ["Concerts", "Icecream", "Coffee"]),
            Card(name: "Milan", imageName: "milan", bio: "witty banter and good company welcome. swipe right?", age: 19, interests: ["Concerts", "Icecream", "Coffee"]),
            Card(name: "William", imageName: "william", bio: "pizza, memes, and the occasional deep talk", age: 19, interests: ["Concerts", "Icecream", "Coffee"]),
            Card(name: "Justin", imageName: "justin", bio: "the cool enough bio...", age: 19, interests: ["Concerts", "Icecream", "Coffee"]),
            Card(name: "Akhil", imageName: "akhil", bio: "seeking adventure and chaos", age: 19, interests: ["Concerts", "Icecream", "Coffee"])

        ]
    }
}
