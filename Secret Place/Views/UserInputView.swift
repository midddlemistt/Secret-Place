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
    @Binding var showingInputView: Bool
    @State private var firstName = ""
    @State private var lastName = ""
    
    var body: some View {
        VStack(spacing: 20) {
            // Кнопка для выбора изображения профиля
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
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Фамилия", text: $lastName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Сохранить") {
                viewModel.updateUser(firstName: firstName, lastName: lastName, age: viewModel.user?.age ?? 0, profileImage: profileImage)
                showingInputView = false // Закрываем вью после сохранения
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            
        }
        .padding()
        .onAppear {
            // При появлении вью, заполнить поля текущими данными пользователя
            self.firstName = viewModel.user?.firstName ?? ""
            self.lastName = viewModel.user?.lastName ?? ""
        }
    }
}





