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
    private var energyRestoreTimer: Timer?
    
    // Инициализатор теперь включает начальные значения для новых параметров
    init() {
        self.user = User(firstName: "Имя", lastName: "Фамилия", age: 0, profileImage: nil,
                         level: 1, rank: "Новичок", coins: 100, energy: 20)
        startEnergyRestoreTimer()
    }
    
    deinit {
            energyRestoreTimer?.invalidate()
        }
    
    // Метод для обновления пользователя
    func updateUser(firstName: String, lastName: String, age: Int, profileImage: UIImage?) {
        let updatedUser = User(firstName: firstName, lastName: lastName, age: age,
                               profileImage: profileImage, level: user?.level ?? 1,
                               rank: user?.calculatedRank ?? "Новичок",
                               coins: user?.coins ?? 100, energy: user?.energy ?? 20)
        self.user = updatedUser
    }
    
    // Методы для управления уровнем, рангом, валютой и энергией
    func completeQuest(rewardExperience: Int, rewardCoins: Int) {
        if let user = user {
            let newLevel = user.level + (rewardExperience / 100) // 100 XP за каждый уровень, например
            let newCoins = user.coins + rewardCoins
            let newRank = determineRank(forLevel: newLevel)
            self.user?.level = newLevel
            self.user?.rank = newRank
            self.user?.coins = newCoins
        }
    }
    
    // Метод для определения ранга на основе уровня
    private func determineRank(forLevel level: Int) -> String {
        switch level {
        case 0..<5: return "Новичок"
        case 5..<10: return "Ученик"
        default: return "Мастер"
        }
    }
    
    func useEnergy(forActivity activityEnergyCost: Int) {
        if let energy = user?.energy, energy >= activityEnergyCost {
            user?.energy -= activityEnergyCost
        }
    }
    
    func startEnergyRestoreTimer() {
            // Запускаем таймер для восстановления энергии каждые 3 минуты
        energyRestoreTimer = Timer.scheduledTimer(timeInterval: 180, target: self,
                                                      selector: #selector(restoreEnergy),
                                                      userInfo: nil, repeats: true)
        }
        
        @objc private func restoreEnergy() {
            // Автоматически восстанавливаем энергию пользователя до максимальной
            if let energy = user?.energy, energy < getMaxEnergyBasedOnRank() {
                user?.energy += 1
            }
        }

        private func getMaxEnergyBasedOnRank() -> Int {
            // Базовая энергия для всех рангов
            var maxEnergy = 20
            
            // Повышаем лимит энергии на основе ранга пользователя
            if let user = user {
                if user.level >= 10 { // Для ученика и выше
                    maxEnergy += 5
                }
                if user.level >= 20 { // Для мастера и выше
                    maxEnergy += 5
                }
            }
            
            return maxEnergy
        }
}
