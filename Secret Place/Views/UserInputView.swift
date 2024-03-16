//
//  UserInputView.swift
//  Secret Place
//
//  Created by 123 on 16.03.24.
//

import SwiftUI

struct UserInputView: View {
    @ObservedObject var viewModel: UserViewModel
    @Binding var profileImage: UIImage?
    @State private var showingImagePicker = false
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var age = ""

    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                showingImagePicker = true
            }) {
                if let profileImage = profileImage {
                    Image(uiImage: profileImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "person.crop.circle.badge.plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .foregroundColor(.gray)
                }
            }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(selectedImage: $profileImage)
            }

            TextField("Имя", text: $firstName)
                .keyboardType(.default)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Фамилия", text: $lastName)
                .keyboardType(.default)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextField("Возраст", text: $age)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Сохранить") {
                let ageInt = Int(age) ?? 0
                viewModel.updateUser(firstName: firstName, lastName: lastName, age: ageInt, profileImage: profileImage)
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding()
    }
}




