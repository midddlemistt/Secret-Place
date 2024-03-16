//
//  UserProfileView.swift
//  Secret Place
//
//  Created by 123 on 14.03.24.
//

import SwiftUI

struct UserProfileView: View {
    @StateObject var viewModel = UserViewModel()
    @State private var showingInputView = false
    @State private var profileImage: UIImage? = UIImage(systemName: "person.crop.circle")

    var body: some View {
        VStack {
            Spacer()

            VStack(spacing: 16) {
                // Изображение профиля
                Image(uiImage: profileImage ?? UIImage())
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.orange, lineWidth: 4))
                    .shadow(radius: 10)
                    .padding(.top)

                // Информация о пользователе
                Text(viewModel.user?.firstName ?? "Имя")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)

                Text(viewModel.user?.lastName ?? "Фамилия")
                    .font(.title3)
                    .foregroundColor(.black)

                Text("Возраст: \(viewModel.user?.age ?? 0) лет")
                    .font(.body)
                    .foregroundColor(.gray)
                
                Button(action: {
                    showingInputView = true
                }) {
                    Text("Редактировать")
                        .fontWeight(.bold)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(20)
                }
                .padding(.horizontal)
            }
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .shadow(radius: 5)
            .padding()

            Spacer()
        }
        .background(Color(.systemGray6)) // Установите здесь фон всего экрана, чтобы соответствовать вашему стилю
        .sheet(isPresented: $showingInputView) {
            UserInputView(viewModel: viewModel, profileImage: $profileImage)
        }
    }
}








