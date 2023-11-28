//
//  SettingsView.swift
//  Tinder
//
//  Created by Saishreeya Kantamsetty on 11/26/23.
//

import SwiftUI

struct SettingsView: View {
    @State private var distance = 5.0
    @State private var minAge = 18.0
    @State private var maxAge = 100.0
    @State private var numPhotos = 1.0
    @State private var hasBio = true
    @State private var isToggle = true
    @State private var isToggle2 = false

    @State private var selectedGender = "Everyone"
    let gender = ["Men", "Women", "Everyone"]
    
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
            Form {
                Section {
                    VStack {
                        HStack {
                            Text("Distance Preference")
                                .padding(.top, 10)
                            Spacer()
                            Text("\(Int(distance)) mi")
                                .foregroundColor(.gray)
                                .padding(.top, 10)
                        }
                        Slider(value: $distance, in: 5...100, step: 1)
                        HStack {
                            Toggle("Only show people in this range", isOn: $isToggle)
                                .toggleStyle(SwitchToggleStyle(tint: Color("tinColor")))
                        }
                        Divider()
                        Picker("Show Me", selection: $selectedGender) {
                            ForEach(gender, id: \.self) {
                                Text($0)
                            }
                        }
                        Divider()
                        HStack {
                            Text("Age Preference")
                                .padding(.top, 10)
                            Spacer()
                            Text("\(Int(minAge)) - \(Int(maxAge))")
                                .foregroundColor(.gray)
                        }
                        HStack {
                            Slider(value: $minAge, in: 18...100, step: 1)
                            Slider(value: $maxAge, in: 19...100, step: 1)
                        }
                        Toggle("Only show people in this range", isOn: $isToggle2)
                            .toggleStyle(SwitchToggleStyle(tint: Color("tinColor")))
                        
                    }
                }
                
                Section {
                    VStack {
                        HStack {
                            Text("Minimum Number of Photos")
                                .padding(.top, 10)
                            Spacer()
                            Text("\(Int(numPhotos))")
                                .foregroundColor(.gray)
                                .padding(.top, 10)
                        }
                        Slider(value: $numPhotos, in: 1...10, step: 1)
                            .padding(.leading, 5)
                        Divider()
                        Toggle("Has a Bio", isOn: $hasBio)
                            .toggleStyle(SwitchToggleStyle(tint: Color("tinColor")))
                        VStack {
                            Divider()
                            HStack {
                                Image(systemName: "eye")
                                Text("Looking For")
                                Spacer()
                                Picker("Looking For", selection: $selectedLookingFor) {
                                    ForEach(lookingFor, id: \.self) {
                                        Text($0)
                                    }
                                }
                            }
                            Divider()
                            HStack {
                                Image(systemName: "eye")
                                Text("Open to...")
                                Spacer()
                                Picker("Open To", selection: $selectedOpenTo) {
                                    ForEach(openTo, id: \.self) {
                                        Text($0)
                                    }
                                }
                            }
                            Divider()
                            HStack {
                                Image(systemName: "moon.stars")
                                Text("Zodiac")
                                Spacer()
                                Picker("Zodiac", selection: $selectedZodiac) {
                                    ForEach(zodiac, id: \.self) {
                                        Text($0)
                                    }
                                }
                            }
                            Divider()
                            HStack {
                                Image(systemName: "graduationcap")
                                Text("Education")
                                Spacer()
                                Picker("Education", selection: $selectedEducation) {
                                    ForEach(education, id: \.self) {
                                        Text($0)
                                    }
                                }
                            }
                            
                            Divider()
                            HStack {
                                Image(systemName: "puzzlepiece")
                                Text("Personality Type")
                                Spacer()
                                Picker("Personality Type", selection: $selectedPersonalityType) {
                                    ForEach(personalityType, id: \.self) {
                                        Text($0)
                                    }
                                }
                            }
                            Divider()
                            HStack {
                                Image(systemName: "phone.bubble.left")
                                Text("Communication")
                                Spacer()
                                Picker("Communication Style", selection: $selectedCommunicationStyle) {
                                    ForEach(communicationStyle, id: \.self) {
                                        Text($0)
                                    }
                                }
                            }
                            Divider()
                            HStack {
                                Image(systemName: "heart")
                                Text("Love Style")
                                Spacer()
                                Picker("Love Style", selection: $selectedLoveStyle) {
                                    ForEach(loveStyle, id: \.self) {
                                        Text($0)
                                    }
                                }
                            }
                            Divider()
                            HStack {
                                Image(systemName: "wineglass")
                                Text("Drinking")
                                Spacer()
                                Picker("Drinking", selection: $selectedDrinking) {
                                    ForEach(drinking, id: \.self) {
                                        Text($0)
                                    }
                                }
                            }
                            Divider()
                            HStack {
                                Image(systemName: "puzzlepiece")
                                Text("Smoking")
                                Spacer()
                                Picker("Smoking", selection: $selectedSmoking) {
                                    ForEach(smoking, id: \.self) {
                                        Text($0)
                                    }
                                }
                            }
                            Divider()
                            HStack {
                                Image(systemName: "leaf")
                                Text("Cannabis")
                                Spacer()
                                Picker("Cannabis", selection: $selectedCannabis) {
                                    ForEach(cannabis, id: \.self) {
                                        Text($0)
                                    }
                                }
                            }
                            Divider()
                            HStack {
                                Image(systemName: "dumbbell")
                                Text("Workout")
                                Spacer()
                                Picker("Workout", selection: $selectedWorkout) {
                                    ForEach(workout, id: \.self) {
                                        Text($0)
                                    }
                                }
                            }
                            Divider()
                            HStack {
                                Image(systemName: "takeoutbag.and.cup.and.straw")
                                Text("Dietary Preference")
                                Spacer()
                                Picker("Dietary Preference", selection: $selectedDietaryPreference) {
                                    ForEach(dietaryPreference, id: \.self) {
                                        Text($0)
                                    }
                                }
                            }
                            Divider()
                            HStack {
                                    Image(systemName: "at")
                                    Text("Social Media")
                                    Spacer()
                                Picker("Social Media", selection: $selectedSocialMedia) {
                                    ForEach(socialMedia, id: \.self) {
                                        Text($0)
                                    }
                                }
                            }
                            Divider()
                            HStack {
                                    Image(systemName: "sun.and.horizon")
                                    Text("Sleeping Habits")
                                    Spacer()
                                Picker("Sleeping Habits", selection: $selectedSleepingHabits) {
                                    ForEach(sleepingHabits, id: \.self) {
                                        Text($0)
                                    }
                                }
                            }
                        }
                        .labelsHidden()
                    }
                    
                    
                    
                    
                    
                } header: {
                    VStack (alignment: .leading) {
                        Text("PREMIUM DISCOVERY")
                            .font(.headline)
                            .foregroundColor(.gray)
                            .fontWeight(.bold)
                            .padding(.bottom, 5)
                            .textCase(nil)
                        Text("Preferences show you people who match your vibe, but won't limit who you see - you'll still be able to match with peopel outside of your selections.")
                            .textCase(nil)
                            .fontWeight(.regular)
                    }
                
                }
            }
            .navigationBarItems(
                leading:
                    Text("Discovery Settings")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.leading, 25)
                )
        }
    }
}

#Preview {
    SettingsView()
}
