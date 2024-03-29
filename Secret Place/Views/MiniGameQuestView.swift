//
//  MiniGameQuestView.swift
//  Secret Place
//
//  Created by 123 on 26.03.24.
//

import SwiftUI

struct MiniGameQuestView: View {
    var quest: MiniGameQuest

    var body: some View {
        Text("Мини-игра: \(quest.title)")
        // Здесь будет отображение для мини-игры
    }
}

