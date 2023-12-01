//
//  PreviewView.swift
//  Tinder
//
//  Created by Saishreeya Kantamsetty on 11/28/23.
//

import SwiftUI

struct PreviewView: View {
    @ObservedObject var sharedViewModel: SharedViewModel
    let images = ["shreeya", "shreeya1", "shreeya3", "shreeya2", "shreeya7", "shreeya5", "shreeya6", "shreeya4", "shreeya8"]
    @State private var currentIndex = 0
    
    
    var body: some View {
        
            ZStack {
                
                ForEach(images.indices, id: \.self) { index in
                    
                    Image(images[index])
                        .resizable()
                        .scaledToFill()
                        .frame(width: 350)
                        .opacity(index == currentIndex ? 1 : 0)
                        .cornerRadius(5)
                        
                        
                        .onTapGesture { location in
                            let screenWidth = 350.0
                            if location.x < screenWidth / 2 {
                                currentIndex = (currentIndex - 1 + images.count) % images.count
                            } else {
                                currentIndex = (currentIndex + 1) % images.count
                            }
                        }
                    HStack {
                        VStack(alignment: .leading) {
                            HStack() {
                                ForEach(0..<images.count) { index in
                                    Rectangle()
                                        .cornerRadius(10)
                                        .frame(width: 300 / 10, height: 4)
                                        .padding(.top, 10)
                                        .foregroundColor(currentIndex == index ? Color.white : Color("darkGray"))
                                    
                               }
                                
                            }
                            .padding(.leading, 30)
                            
                            Spacer()

                            HStack {
                                Text("Shreeya")
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .padding(.leading, 35)
                                    
                                Text("19")
                                    .font(.title)
                            }
                                Text(sharedViewModel.bioText)
                                    .padding(.leading, 35)
                                    .padding(.bottom, 10)
                            
                        }
                        .foregroundColor(.white)
                        Spacer()
                    }


                                
                }
            }
        
    }
}

#Preview {
    PreviewView(sharedViewModel: SharedViewModel())
}
