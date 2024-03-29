//
//  QuestionQuestViewModel.swift
//  Secret Place
//
//  Created by 123 on 26.03.24.
//

import Foundation
import SwiftUI

class QuestionQuestViewModel: ObservableObject {
    @Published var quest: QuestionQuest
    @Published var showQuest = true
    @Published var questCompleted = false
    @Published var answerSelected = false
    @Published var selectedAnswerIndex: Int?
    var onCompletion: ((Bool) -> Void)?

    init(quest: QuestionQuest) {
        self.quest = quest
    }
    
    func selectAnswer(at index: Int) {
        selectedAnswerIndex = index
        answerSelected = true
        questCompleted = true 
        
        onCompletion?(questCompleted)
    }
    
    func hideQuest() {
        showQuest = false
    }
    
    func colorForAnswer(at index: Int) -> Color {
        guard let selectedAnswerIndex = selectedAnswerIndex else { return .blue }
        if index == selectedAnswerIndex {
            return quest.answers[index] == quest.correctAnswer ? .green : .red
        }
        return .blue
    }
}

