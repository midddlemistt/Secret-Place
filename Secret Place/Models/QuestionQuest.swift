//
//  QuestionQuest.swift
//  Secret Place
//
//  Created by 123 on 26.03.24.
//

import Foundation

struct QuestionQuest: Quest {
    let id: UUID
    let title: String
    let description: String
    let question: String
    let answers: [String]
    let correctAnswer: String
    
    func performQuest() {
        // Логика выполнения квеста с вопросом
    }
}

