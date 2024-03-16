//
//  UserViewModel.swift
//  Secret Place
//
//  Created by 123 on 14.03.24.
//

import Foundation
import UIKit

class UserViewModel: ObservableObject {
    @Published var user: User?
    @Published var isEditing: Bool = false
    
        
    init() {
        // Инициализируем с демо-данными или загружаем из хранилища/сети
        self.user = User(firstName: "Имя", lastName: "Фамилия", age: 0, profileImage: nil)
    }
    
    func updateUser(firstName: String, lastName: String, age: Int, profileImage: UIImage?) {
        let updatedUser = User(firstName: firstName, lastName: lastName, age: age, profileImage: profileImage)
        self.user = updatedUser
        // Здесь можно добавить логику отправки данных на сервер
    }
    
    // Пример метода для имитации отправки данных на "сервер"
    func sendDataToServer() {
        guard let user = user else { return }
        print("Отправляем данные пользователя на сервер: \(user)")
        // Здесь будет код для отправки данных пользователя на сервер
    }
}
