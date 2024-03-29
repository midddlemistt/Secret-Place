//
//  MiniGameQuest.swift
//  Secret Place
//
//  Created by 123 on 26.03.24.
//

import Foundation

struct MiniGameQuest: Quest {
    let id: UUID
    let title: String
    let description: String
    let gameType: MiniGameType
    // Параметры для мини-игры
    
    func performQuest() {
        // Логика выполнения мини-игры
    }
}

enum MiniGameType {
    case ticTacToe
    case checkers
    // Другие типы игр
}

