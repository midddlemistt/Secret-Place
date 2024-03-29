//
//  FindObjectQuest.swift
//  Secret Place
//
//  Created by 123 on 26.03.24.
//

import Foundation

struct FindObjectQuest: Quest {
    let id: UUID
    let title: String
    let description: String
    let objectName: String // Название объекта для поиска
    
    func performQuest() {
        // Логика выполнения квеста на поиск
    }
}

