//
//  DragonHutViewModel.swift
//  Secret Place
//
//  Created by 123 on 14.03.24.
//

import Combine
import Foundation

class DragonHutViewModel: ObservableObject {
    @Published var dragon = Dragon(name: "Hut", happiness: 50, fullness: 50, energy: 50)
    var happinessDecayTimer: Timer?
    var fullnessDecayTimer: Timer?
    
    init() {
        // Запускаем таймер, который будет уменьшать со временем
        happinessDecayTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self,
                                                   selector: #selector(decreaseHappiness),
                                                   userInfo: nil, repeats: true)
        
        fullnessDecayTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(decreaseFullness), userInfo: nil, repeats: true)
        
    }
    
    deinit {
        happinessDecayTimer?.invalidate()
    }
    
    @objc private func decreaseHappiness() {
        // Автоматическое уменьшение уровня счастья со временем
        dragon.happiness = max(dragon.happiness - 1, 0)
    }
    
    @objc private func decreaseFullness() {
        // Автоматическое уменьшение уровня счастья со временем
        dragon.fullness = max(dragon.fullness - 1, 0)
    }
    
    func feedDragon() {
        // Покормить дракона: увеличиваем сытость, уменьшаем счастье (немного)
        dragon.fullness = min(dragon.fullness + 10, 100)
        dragon.happiness = min(dragon.happiness + 1, 100) // Увеличение счастья сделаем небольшим
        dragon.energy = min(dragon.energy + 1, 100) // Питание также немного увеличивает энергию
    }
    
    func playWithDragon() {
        // Играть с драконом: увеличиваем счастье, уменьшаем сытость и энергию
        if dragon.energy > 10 && dragon.fullness > 10 {
            dragon.happiness = min(dragon.happiness + 3, 100) // Игра увеличивает счастье
            dragon.energy -= 10
            dragon.fullness -= 5 // Игра уменьшает сытость
        }
    }
    
    func letDragonSleep() {
        // Уложить дракона спать: восстанавливаем энергию, уменьшаем сытость
        dragon.energy = 100
        dragon.fullness = max(dragon.fullness - 5, 0) // Сон уменьшает сытость
    }
}


