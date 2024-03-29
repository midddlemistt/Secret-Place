//
//  FindObjectQuestView.swift
//  Secret Place
//
//  Created by 123 on 26.03.24.
//

import SwiftUI

struct FindObjectQuestView: View {
    var quest: FindObjectQuest

    var body: some View {
        Text("Поиск: \(quest.title)")
        // Здесь будет интерфейс для поиска объекта
    }
}

