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
            VStack(spacing: 20) {
                if let user = viewModel.user {
                    // Аватар пользователя
                    Image(uiImage: user.profileImage ?? UIImage(systemName: "person.crop.circle")!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                        .padding(.top, 20)

                    // Текстовая информация
                    VStack(spacing: 10) {
                        Text("\(user.firstName) \(user.lastName)")
                            .font(.title2)
                            .fontWeight(.bold)

                        Text("Возраст: \(user.age)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        Text("Ранг: \(user.rank)")
                            .fontWeight(.semibold)
                            .padding(.vertical, 4)
                            .frame(minWidth: 100)
                            .background(Color.green.opacity(0.2))
                            .clipShape(Capsule())
                        
                        // Монеты пользователя
                        Text("Монеты: \(user.coins)")
                            .fontWeight(.semibold)
                            .padding(.vertical, 4)
                            .frame(minWidth: 100)
                            .background(Color.yellow.opacity(0.2))
                            .clipShape(Capsule())
                    }
                    .padding()

                    // Индикаторы уровня и энергии
                    HStack(spacing: 40) {
                        LevelIndicatorView(level: user.level)
                        EnergyIndicatorView(energy: user.energy, maxValue: 20)
                    }
                    .padding(.top, 20)

                    // Кнопка редактирования профиля
                    Button(action: { showingInputView = true }) {
                        Text("Редактировать профиль")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.purple)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    .sheet(isPresented: $showingInputView) {
                        UserInputView(viewModel: viewModel, profileImage: $profileImage, showingInputView: $showingInputView)
                    }

                    Spacer()
                }
            }
            .background(Color(.systemGray6))
        }
    }

#Preview {
    UserProfileView()
}








