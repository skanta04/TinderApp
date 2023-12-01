//
//  LikedCardsViewModel.swift
//  Tinder
//
//  Created by Saishreeya Kantamsetty on 11/29/23.
//

import Foundation

class LikedCardsViewModel: ObservableObject {
    @Published var likeCards: [Card] = [] {
        didSet {
            print("hi")
        }
    }
}
