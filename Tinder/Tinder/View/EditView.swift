//
//  EditView.swift
//  Tinder
//
//  Created by Saishreeya Kantamsetty on 11/28/23.
//

import SwiftUI

struct EditView: View {
    @StateObject private var sharedViewModel = SharedViewModel()
    private var images = ["shreeya", "shreeya1", "shreeya2", "shreeya3", "shreeya4", "shreeya5", "shreeya6","shreeya7", "shreeya8"]
    @State var deletedImages: [Bool] = Array(repeating: false, count:9)
    @State private var hasPhotos = true
    @State private var showAge = false
    @State private var showDistance = true
    @State private var imageDeleted = false
    
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    @State private var selectedLookingFor = "Short-term fun"
    let lookingFor = ["Long-term partner", "Long-term, open to short", "Short-term, open to long", "Short-term, open to long", "Short-term fun", "New friends", "Still figuring it out"]
    
    @State private var selectedOpenTo = "Monogamy"
    let openTo = ["Monogamy", "Ethical non-monogamy", "Open relationship", "Polyamory", "Open to exploring"]
    
    @State private var selectedZodiac = "Pisces"
    let zodiac = ["Capricorn", "Aquarius", "Pisces", "Aries", "Taurus", "Gemini", "Pisces", "Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius"]
    
    @State private var selectedEducation = "In College"
    let education = ["Bachelors", "In College", "High School", "PhD", "In Grad School", "Masters", "Trade School"]
    
    @State private var selectedPersonalityType = "INTJ"
    let personalityType = ["INTJ", "INTP", "ENTJ", "ENTP", "INFJ", "INFP", "ENFJ", "ENFP", "ISTJ", "ESTJ", "ESFJ", "ISTP", "ISFP", "ESTP", "ESFP"]
    
    @State private var selectedCommunicationStyle = "Phone caller"
    let communicationStyle = ["Big time texter", "Phone caller", "Video chatt..", "Bad texter", "Better in person"]
    
    @State private var selectedLoveStyle = "Presents"
    let loveStyle = ["Thoughtful gestures", "Presents", "Touch", "Compliments", "Time together"]
    
    @State private var selectedDrinking = "Sober"
    let drinking = ["Not for me", "Sober", "Sober curious", "On special occasions", "Socially on weekends", "Most Nights"]
    
    @State private var selectedSmoking = "Non-smoker"
    let smoking = ["Social smoker", "Smoker when drinking", "Non-smoker", "Smoker", "Trying to quit"]
    
    @State private var selectedCannabis = "Socially"
    let cannabis = ["Yes", "Occasionally", "Socially", "Never"]
    
    @State private var selectedWorkout = "Often"
    let workout = ["Everyday", "Often", "Sometimes", "Never"]
    
    @State private var selectedDietaryPreference = "Vegetarian"
    let dietaryPreference = ["Vegan", "Vegetarian", "Pescatarian", "Kosher", "Halal", "Carnivore", "Omnivore", "Other"]
    
    @State private var selectedSocialMedia = "Socially active"
    let socialMedia = ["Influencer status", "Socially active", "Off the grid", "Passive scroller"]
    
    @State private var selectedSleepingHabits = "Early bird"
    let sleepingHabits = ["Early bird", "Night owl", "In a spectrum"]
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ScrollView {
                        LazyVGrid(columns: gridItemLayout, spacing: 5) {
                            ForEach((images.indices), id: \.self) {index in
                                let image = images[index]
                                ZStack {
                                    if deletedImages[index] {
                                        Rectangle()
                                            .fill(.clear)
                                            .frame(width: 110, height: 160)
                                            .overlay(
                                            RoundedRectangle(cornerRadius: 8)
                                                .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                                                .foregroundColor(Color("darkGray"))
                                            )
                                
                                            } else {
                                            Image(image)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 110, height: 160)
                                                .clipShape(Rectangle())
                                                .cornerRadius(4)
                                                .padding(.trailing, 10)
                                                }
                                                Button (action: {
                                                    deletedImages[index].toggle()
                                                }, label: {
                                                    if deletedImages[index] {
                                                        circleAdd()

                                                    }
                                                    else {
                                                        circleDelete()
                                                    }
                                                    })
                                                    .buttonStyle(.plain)
                                                    .offset(x: 44, y: 75)
                                    }
                                    .padding(.top, 15)
                            }
                        }
                    }
                    
                }
            header: {
                Text("MEDIA")
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .font(.headline)
            }
            .listRowBackground(Color("#D3D3D3"))
            .listRowSeparator(.hidden)
                
                Section {
                    Toggle("Has a Bio", isOn: $hasPhotos)
                        .toggleStyle(SwitchToggleStyle(tint: Color("tinColor")))
                    Text("Smart Photos continuously tests all your profile photos and picks the best one to show first. ")
                        .font(.caption)
                        .foregroundColor(Color("darkGray"))                .listRowBackground(Color("#D3D3D3"))
                        .listRowSeparator(.hidden)
                    
                } header: {
                    Text("PHOTO OPTIONS")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .font(.headline)
                }
                
                Section {
                    TextEditor(text: $sharedViewModel.bioText)
                        .font(.subheadline)
                        .foregroundColor(Color("darkGray"))
                    
                } header: {
                    
                    Text("ABOUT ME")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .font(.headline)
                }
                
                Section {
                    HStack {
                        Image(systemName: "eye")
                            .foregroundColor(Color("darkGray"))
                        Text("Looking For")
                        Spacer()
                        Picker("Looking For", selection: $selectedLookingFor) {
                            ForEach(lookingFor, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                } header : {
                    Text("Relationship Goals")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .font(.headline)
                }
                .labelsHidden()
                
                Section {
                    HStack {
                        Image(systemName: "eye")
                            .foregroundColor(Color("darkGray"))
                        Text("Open to...")
                        Spacer()
                        Picker("Open To", selection: $selectedOpenTo) {
                            ForEach(openTo, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                } header: {
                    Text("Relationship Type")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .font(.headline)
                }
                .labelsHidden()
                
                Section {
                    HStack {
                        Image(systemName: "moon.stars")
                            .foregroundColor(Color("darkGray"))
                        Text("Zodiac")
                        Spacer()
                        Picker("Zodiac", selection: $selectedZodiac) {
                            ForEach(zodiac, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                    HStack {
                        Image(systemName: "graduationcap")
                            .foregroundColor(Color("darkGray"))
                        Text("Education")
                        Spacer()
                        Picker("Education", selection: $selectedEducation) {
                            ForEach(education, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                    
                    HStack {
                        Image(systemName: "puzzlepiece")
                            .foregroundColor(Color("darkGray"))
                        Text("Personality Type")
                        Spacer()
                        Picker("Personality Type", selection: $selectedPersonalityType) {
                            ForEach(personalityType, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                    HStack {
                        Image(systemName: "phone.bubble.left")
                            .foregroundColor(Color("darkGray"))
                        Text("Communication")
                        Spacer()
                        Picker("Communication Style", selection: $selectedCommunicationStyle) {
                            ForEach(communicationStyle, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                    HStack {
                        Image(systemName: "heart")
                            .foregroundColor(Color("darkGray"))
                        Text("Love Style")
                        Spacer()
                        Picker("Love Style", selection: $selectedLoveStyle) {
                            ForEach(loveStyle, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                } header: {
                    Text("Basics")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .font(.headline)
                }
                .labelsHidden()
                .listRowSeparator(.hidden)
                
                Section {
                    HStack {
                        Image(systemName: "wineglass")
                            .foregroundColor(Color("darkGray"))
                        Text("Drinking")
                        Spacer()
                        Picker("Drinking", selection: $selectedDrinking) {
                            ForEach(drinking, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                    HStack {
                        Image(systemName: "puzzlepiece")
                            .foregroundColor(Color("darkGray"))
                        Text("Smoking")
                        Spacer()
                        Picker("Smoking", selection: $selectedSmoking) {
                            ForEach(smoking, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                    HStack {
                        Image(systemName: "leaf")
                            .foregroundColor(Color("darkGray"))
                        Text("Cannabis")
                        Spacer()
                        Picker("Cannabis", selection: $selectedCannabis) {
                            ForEach(cannabis, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                    HStack {
                        Image(systemName: "dumbbell")
                            .foregroundColor(Color("darkGray"))
                        Text("Workout")
                        Spacer()
                        Picker("Workout", selection: $selectedWorkout) {
                            ForEach(workout, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                    HStack {
                        Image(systemName: "takeoutbag.and.cup.and.straw")
                            .foregroundColor(Color("darkGray"))
                        Text("Dietary Preference")
                        Spacer()
                        Picker("Dietary Preference", selection: $selectedDietaryPreference) {
                            ForEach(dietaryPreference, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                    HStack {
                            Image(systemName: "at")
                            .foregroundColor(Color("darkGray"))
                            Text("Social Media")
                            Spacer()
                        Picker("Social Media", selection: $selectedSocialMedia) {
                            ForEach(socialMedia, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                    HStack {
                            Image(systemName: "sun.and.horizon")
                            .foregroundColor(Color("darkGray"))
                            Text("Sleeping Habits")
                            Spacer()
                        Picker("Sleeping Habits", selection: $selectedSleepingHabits) {
                            ForEach(sleepingHabits, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                } header: {
                    Text("Lifestyle")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .font(.headline)
                }
                .labelsHidden()
                .listRowSeparator(.hidden)
                
                Section {
                    Toggle("Don't Show My Age", isOn: $showAge)
                        .toggleStyle(SwitchToggleStyle(tint: Color("tinColor")))
                    Toggle("Don't Show My Distance", isOn: $showDistance)
                        .toggleStyle(SwitchToggleStyle(tint: Color("tinColor")))
                } header: {
                    Text("Control your profile")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .font(.headline)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(GroupedListStyle())
            
            
        }
    }
}

struct circleDelete: View {
    var body: some View {
        Circle()
            .stroke(Color.gray, lineWidth: 1)
            .background(Circle().foregroundColor(Color.white))
            .frame(width: 25, height: 25)
            .overlay (
                Text("X")
                    .frame(width: 30, height: 20)
                    .foregroundColor(.gray)
                    .fontWeight(.bold)
            )
    }
}

struct circleAdd: View {
    var body: some View {
        Circle()
            .fill(LinearGradient(gradient: Gradient(colors: [Color.accentColor, Color.tinColor2, Color.tinColor3]), startPoint: .leading, endPoint: .trailing))
            .frame(width: 25, height: 25)
            .overlay (
                Text("+")
                    .foregroundColor(.white)
                    .font(.title2)
                    .fontWeight(.bold)
            )
    }
}

#Preview {
    EditView()
}
