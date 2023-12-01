//
//  TinderSilverView.swift
//  Tinder
//
//  Created by Saishreeya Kantamsetty on 11/29/23.
//

import SwiftUI

struct TinderSilverView: View {
    var body: some View {
        Image("tinSilver")
            .resizable()
            .scaledToFill()
            .frame(width: 315, height: 219)
            .border(Color.gray, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    TinderSilverView()
}
