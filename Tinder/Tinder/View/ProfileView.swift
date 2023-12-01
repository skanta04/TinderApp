//
//  ProfileView.swift
//  Tinder
//
//  Created by Saishreeya Kantamsetty on 11/26/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Image("tinder")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .padding(.leading, 10)
                    Text("tinder")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color("tinColor"), Color("tinColor2"), Color("tinColor3")]), startPoint: .leading, endPoint: .trailing))
                    Spacer()
                    
                    Image(systemName: "shield.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 23, height: 23)
                        .foregroundColor(.gray)
                        .padding(.trailing, 10)
                    NavigationLink(destination: PersonalSettingsView()) {
                            Image(systemName: "gearshape.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 23, height: 23)
                                .foregroundColor(.gray)
                                .padding(.trailing, 10)
                        }
                    
                    }
                ZStack {
                    VStack {
                
                        Image("shreeya")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color("tinColor"), lineWidth: 4)
                        )
                    }
                    NavigationLink(destination: ProfileEditView()) {
                        Image("edit")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.gray)
                            
                    }
                    .offset(x: 50, y: -65)
                    

                    VStack {
                        Rectangle()
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color("tinColor"), Color("tinColor2"), Color("tinColor3")]), startPoint: .leading, endPoint: .trailing))
                            .frame(width: 170, height: 35)
                            .cornerRadius(40)
                            .overlay(
                                Text("100% COMPLETE")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                            )
                    }
                    .padding(.top, 140)
                }
                HStack {
                    Text("Shreeya, 19")
                        .font(.system(size: 30))
                        .fontWeight(.light)
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .foregroundColor(.blue)
                        .frame(width: 30, height: 30)
                        
                    
                }
                VStack {
                    HStack(spacing: 15) {
                        Rectangle()
                            .frame(width: 115, height: 100)
                            .cornerRadius(8)
                            .foregroundColor(.white)
                        
                            .overlay (
                                VStack {
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.blue)
                                        .padding(.bottom, 5)
                                    Text("10 Super Likes")
                                    Text("GET MORE")
                                        .foregroundColor(.blue)
                                }
                                    .font(.caption)
                            )
                        Rectangle()
                            .frame(width: 115, height: 100)
                            .cornerRadius(8)
                            .foregroundColor(.white)
                            .overlay (
                                VStack {
                                    Image(systemName: "bolt.fill")
                                        .resizable()
                                        .frame(width: 20, height: 30)
                                        .foregroundColor(.purple)
                                        .padding(.bottom, 5)
                                    
                                    Text("My Boosts")
                                    Text("GET MORE")
                                        .foregroundColor(.purple)
                                }
                                    .font(.caption)
                            )
                        Rectangle()
                            .frame(width: 115, height: 100)
                            .cornerRadius(8)
                            .foregroundColor(.white)
                            .overlay (
                                VStack {
                                    Image("tinder")
                                        .resizable()
                                        .frame(width: 35, height: 35)
                                        .padding(.bottom, 5)
                                    
                                    Text("Subscriptions")
                                    
                                }
                            )
                            .font(.caption)
                        
                        
                    }
                    .padding(.top, 20)
                    .padding([.leading, .trailing], 40)
                    .ignoresSafeArea()
                    
                    TabView {
                        TinderGoldView()
                        TinderSilverView()
                        TinderPlusView()
                    }
                    .tabViewStyle(.page(indexDisplayMode: .always))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                }
                .background(LinearGradient(gradient: Gradient(colors: [Color(.systemGray5), Color(.white)]), startPoint: .top, endPoint: .bottom))
                Spacer()
                
            }
            
        }
    }
}

#Preview {
    ProfileView()
}
