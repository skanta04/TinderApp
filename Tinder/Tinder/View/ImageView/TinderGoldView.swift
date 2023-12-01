//
//  TinderGoldView.swift
//  Tinder
//
//  Created by Saishreeya Kantamsetty on 11/29/23.
//

import SwiftUI

struct TinderGoldView: View {
    var body: some View {
        Image("tinGold")
            .resizable()
            .scaledToFill()
            .frame(width: 315, height: 217)
            .border(Color.yellow, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    TinderGoldView()
}
