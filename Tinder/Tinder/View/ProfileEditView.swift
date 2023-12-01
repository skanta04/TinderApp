//
//  ProfileEditView.swift
//  Tinder
//
//  Created by Saishreeya Kantamsetty on 11/28/23.
//

import SwiftUI

struct ProfileEditView: View {
    
    @State private var selectedContent: ContentViewType = .edit
    
    @State private var edit = "Edit"
    @State private var preview = "Preview"
    @State private var isEdit = false
    @State private var isPreview = true
    enum ContentViewType {
        case edit
        case preview
    }
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    Spacer()
                    Text(edit)
                        .padding()
                        .foregroundStyle(isEdit ? LinearGradient(gradient: Gradient(colors: [ Color.gray]), startPoint: .leading, endPoint: .trailing) : LinearGradient(gradient: Gradient(colors: [Color("tinColor"), Color("tinColor2"), Color("tinColor3")]), startPoint: .leading, endPoint: .trailing))
                        .onTapGesture {
                            withAnimation {
                                selectedContent = .edit
                                isEdit = false
                                isPreview = true
                            }
                        }
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    Divider().frame(width: 1, height: 40)
                    Spacer()
                    Text(preview)
                        .padding()
                        .foregroundStyle(isPreview ? LinearGradient(gradient: Gradient(colors: [ Color.gray]), startPoint: .leading, endPoint: .trailing) : LinearGradient(gradient: Gradient(colors: [Color("tinColor"), Color("tinColor2"), Color("tinColor3")]), startPoint: .leading, endPoint: .trailing))
                        .onTapGesture {
                            withAnimation {
                                selectedContent = .preview
                                isEdit = true
                                isPreview = false
                                
                            }
                        }
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                        
                }
                if (selectedContent == .edit) {
                    EditView()
                        .transition(.opacity)
                    
                }
                if (selectedContent == .preview) {
                    PreviewView(sharedViewModel: SharedViewModel())
                        .transition(.opacity)
                }
                Spacer()
            }
            .navigationBarItems(
                leading:
                    Text("Edit Info")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.leading, 85)
                )
        }
    }
}



#Preview {
    ProfileEditView()
}
