//
//  PersonalSettingsView.swift
//  Tinder
//
//  Created by Saishreeya Kantamsetty on 11/29/23.
//

import SwiftUI

struct PersonalSettingsView: View {
    @State private var phoneNumber = "919-444-5555"
    @State private var email = "shreeya@gmail.com"
    @State private var selectedOption = 1
    @State private var selectedVisibility = 0



    var body: some View {
        NavigationStack {
            List {
                Section {
                    Rectangle()
                        .foregroundColor(.white)
                        .overlay (
                            VStack {
                                Image("platWord")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 55)
                                Text("Priority Likes, See who Likes you & More")
                                    .font(.caption)
                                    .foregroundColor(.darkGray)
                            }
                        )
                }
                .padding()
                .padding(.bottom, 20)
                Section {
                    Rectangle()
                        .foregroundColor(.white)
                        .overlay (
                            VStack {
                                Image("goldWord")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 45)
                                Text("See Who Likes You & More!")
                                    .font(.caption)
                                    .foregroundColor(.darkGray)
                            }
                        )
                }
                .padding()
                .padding(.bottom, 20)
                Section {
                    Rectangle()
                        .foregroundColor(.white)
                        .overlay (
                            VStack {
                                Image("regWord")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 50)
                                Text("Unlimited Likes & More")
                                    .font(.caption)
                                    .foregroundColor(.darkGray)
                            }
                        )
                }
                .padding()
                .padding(.bottom, 20)
                Section {
                    Rectangle()
                        .foregroundColor(.white)
                        .overlay (
                            VStack {
                                Image(systemName: "eye.slash.fill")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 20, height: 20)
                                Text("Go Incognito")
                                    .font(.caption)
                                    .foregroundColor(.darkGray)
                            }
                        )
                }
                .padding()
                
                Section {
                    HStack {
                        Text("Phone Number")
                            .foregroundColor(.black)
                        TextField("", text: $phoneNumber)
                            .multilineTextAlignment(.trailing)
                            
                    }
                    HStack {
                        Text("Email")
                            .foregroundColor(.black)
                        TextField("", text: $email)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(.accent)
                            
                    }
                } header: {
                    Text("ACCOUNT SETTINGS")
                        .font(.headline)
                        .foregroundColor(Color("darkGray"))
                        .fontWeight(.bold)
                }
                
                Section {
                    Button(action: {
                        selectedOption = 0
                    }, label: {
                        HStack {
                            VStack (alignment: .leading) {
                                Text("Balanced Recommendations")
                                Text("See the most relevant people to you (default setting)")
                                    .font(.caption)
                            }
                            .foregroundColor(.black)
                            Spacer()
                            if (selectedOption == 0) {
                                Image(systemName: "checkmark")
                            }
                        }
                    })
                    
                    Button(action: {
                        selectedOption = 1
                    }, label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Recently Active")
                                Text("See the most recently active people first")
                                    .font(.caption)
                            }
                            .foregroundColor(.black)
                            Spacer()
                            if (selectedOption == 1) {
                                Image(systemName: "checkmark")
                            }
                        }
                    })
                    
                    
                } header: {
                    Text("Control who you see")
                        .font(.headline)
                        .foregroundColor(Color("darkGray"))
                        .fontWeight(.bold)
                }
                
                Section {
                    Button(action: {
                        selectedVisibility = 0
                    }, label: {
                        HStack {
                            VStack (alignment: .leading) {
                                Text("Standard")
                                Text("You will be discoverable in the card stack")
                                    .font(.caption)
                            }
                            .foregroundColor(.black)
                            Spacer()
                            if (selectedVisibility == 0) {
                                Image(systemName: "checkmark")
                            }
                        }
                    })
                   
                    Button(action: {
                        selectedVisibility = 1
                    }, label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Incognito")
                                Text("You will be discoverable only by people you like")
                                    .font(.caption)
                            }
                            .foregroundColor(.black)
                            Spacer()
                            if (selectedVisibility == 1) {
                                Image(systemName: "checkmark")
                            }
                        }
                    })
                    
                } header: {
                    Text("Control my visibility")
                        .font(.headline)
                        .foregroundColor(Color("darkGray"))
                        .fontWeight(.bold)
                }
                
            }
            .listSectionSpacing(8)
            .listStyle(GroupedListStyle())
            .navigationBarItems(
                leading:
                    Text("Settings")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.leading, 80)
                )
            
            
            
        }
    }
}

#Preview {
    PersonalSettingsView()
}
