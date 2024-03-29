//
//  Quest.swift
//  Secret Place
//
//  Created by 123 on 14.03.24.
//

import Foundation

protocol Quest {
    var id: UUID { get }
    var title: String { get }
    var description: String { get }
    func performQuest()
}

