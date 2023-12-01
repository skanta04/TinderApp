//
//  LikesView.swift
//  Tinder
//
//  Created by Saishreeya Kantamsetty on 12/1/23.
//

import SwiftUI

struct LikesView: View {
    @State private var selectedContent: ContentViewType = .likes
    
    @State private var likes = "99+ Likes"
    @State private var topPicks = "10 Top Picks"
    @State private var isLikes = false
    @State private var isTopPicks = true
    
    enum ContentViewType {
        case likes
        case topPicks
    }
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    Spacer()
                    Text(likes)
                        .padding()
                        .foregroundColor(isLikes ? Color.gray : Color.black)
                        .onTapGesture {
                            withAnimation {
                                selectedContent = .likes
                                isLikes = false
                                isTopPicks = true
                            }
                        }
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    Divider().frame(width: 1, height: 40)
                    Spacer()
                    Text(topPicks)
                        .padding()
                        .foregroundColor(isTopPicks ? Color.gray : Color.black)
                        .onTapGesture {
                            withAnimation {
                                selectedContent = .topPicks
                                isLikes = true
                                isTopPicks = false
                                
                            }
                        }
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    
                }
                Spacer()
            }
        }
    }
}

#Preview {
    LikesView()
}
