//
//  CardView.swift
//  Tinder
//
//  Created by Saishreeya Kantamsetty on 11/26/23.
//

import SwiftUI

struct CardView: View {
    let cardGradient = Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.5)])
    @State var card: Card
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image(card.imageName)
                .resizable()
            LinearGradient(gradient: cardGradient, startPoint: .top, endPoint: .bottom)
            VStack {
                Spacer()
                VStack(alignment: .leading) {
                    HStack {
                        Text(card.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text(String(card.age))
                            .font(.title)
                    }
                    Text(card.bio)
                    
                    HStack {
                        Button {
                            
                        } label: {
                            Image("rewind")
                                .resizable()
                                .scaledToFit()
                                
                        }
                        
                        Button {
                           swipeLeft()
                        } label: {
                            Image("nope")
                                .resizable()
                                .scaledToFit()
                        }
                        
                        Button {
                            swipeUp()
                        } label: {
                            Image("superlike")
                                .resizable()
                                .scaledToFit()
                        }
                        
                        Button {
                            swipeRight()
                        } label: {
                            Image("love")
                                .resizable()
                                .scaledToFit()
                        }
                        
                        Button {
                            
                        } label: {
                            Image("charge")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                }
            }
            .padding()
            .foregroundColor(.white)
            
            VStack {
                HStack {
                    Image("yes")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200)
                        .opacity(Double(card.x/10 - 1))
                    Spacer()
                    Image("no")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200)
                        .opacity(Double(card.x/10 * -1 - 1))
                    
                }
                Spacer()
                Image("super")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
                    .opacity(Double(card.y/50 * -1 - 1))
                    .padding(.bottom, 50)
            }
        }
        .cornerRadius(8)
        .padding()
        
        .offset(x: card.x, y: card.y)
        .rotationEffect(.init(degrees: card.degree))
        
        .gesture (
            DragGesture()
                .onChanged{ value in
                    //for dragging the card
                    onDragChanged(value)
                }
                .onEnded{ value in
                    // when user stops dragging
                    onDragEnd(value)
                }
        )
    }
    
    private func onDragChanged(_ value: DragGesture.Value) {
        withAnimation(.default) {
            card.x = value.translation.width
            card.y = value.translation.height
            card.degree = 7 * (value.translation.width > 0 ? 1: -1)
        }
    }
    
    private func onDragEnd(_ value: DragGesture.Value) {
        withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 50, damping: 8, initialVelocity: 0)) {
            switch value.translation.width {
            case 0...100:
                card.x = 0; card.degree = 0; card.y = 0
            case let x where x > 100:
                card.x = 500; card.degree = 12
            case (-100)...(-1):
                card.x = 0; card.degree = 0; card.y = 0
            case let x where x < -100:
                card.x = -500; card.degree = -12
            default:
                break
            }
            
            switch value.translation.height {
            case let y where y < -400:
                swipeUp()
            default:
                break
            }
        }
    }
    
    private func swipeLeft() {
        withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 50, damping: 8, initialVelocity: 0)) {
            card.x = -500
            card.degree = -12
        }
    }
    
    private func swipeRight() {
        withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 50, damping: 8, initialVelocity: 0)) {
            card.x = 500
            card.degree = 12
        }
    }
    
    private func swipeUp() {
        withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 50, damping: 8, initialVelocity: 0)) {
            card.y = -1000
            card.degree = 0
        }
    }
}

#Preview {
    CardView(card: Card(name: "Ellie", imageName: "ellie", bio: "Some interesting bio text", age: 19, interests: ["happy"]))
}
