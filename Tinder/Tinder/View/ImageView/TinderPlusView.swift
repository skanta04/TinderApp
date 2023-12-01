//
//  TinderPlusView.swift
//  Tinder
//
//  Created by Saishreeya Kantamsetty on 11/29/23.
//

import SwiftUI

struct TinderPlusView: View {
    var body: some View {
        Image("tinPlus")
            .resizable()
            .scaledToFill()
            .frame(width: 315, height: 221)
            .border(Color("tinColor"), width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    TinderPlusView()
}
