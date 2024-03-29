//
//  User.swift
//  Secret Place
//
//  Created by 123 on 14.03.24.
//

import Foundation
import UIKit

struct User {
    var firstName: String
    var lastName: String
    var age: Int
    var profileImage: UIImage?
    var level: Int
    var rank: String
    var coins: Int
    var energy: Int

    // Рассчитываем ранг на основе уровня пользователя
    var calculatedRank: String {
        switch level {
        case 0..<5: return "Новичок"
        case 5..<10: return "Ученик"
        default: return "Мастер"
        }
    }
}

