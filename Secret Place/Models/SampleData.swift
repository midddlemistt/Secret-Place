//
//  SampleData.swift
//  Secret Place
//
//  Created by 123 on 14.03.24.
//

import Foundation
import CoreLocation

struct SampleData {
    static let sampleRoute = Route(
        id: UUID(),
        name: "Путь отважных",
        description: "Этот маршрут проведет вас через самые живописные уголки города, каждый из которых скрывает свои загадки.",
        points: [
            Route.RoutePoint(
                coordinate: CLLocationCoordinate2D(latitude: 53.9006, longitude: 27.5590),
                title: "Площадь Свободы",
                description: "Сердце города и начало вашего пути.",
                quest: QuestionQuest(
                    id: UUID(),
                    title: "Тайна площади",
                    description: "Какой исторический символ находится в центре Площади Свободы?",
                    question: "Что символизирует статуя в центре площади?",
                    answers: ["Свободу", "Единство", "Мир", "Победу"],
                    correctAnswer: "Свободу"
                )
            ),
            Route.RoutePoint(
                coordinate: CLLocationCoordinate2D(latitude: 53.8986, longitude: 27.5623),
                title: "Городская Ратуша",
                description: "Историческое здание с богатой историей.",
                quest: QuestionQuest(
                    id: UUID(),
                    title: "Загадка Ратуши",
                    description: "В каком веке была построена Городская Ратуша?",
                    question: "Век постройки Городской Ратуши?",
                    answers: ["XVI век", "XVII век", "XVIII век", "XIX век"],
                    correctAnswer: "XVII век"
                )
            ),
            Route.RoutePoint(
                coordinate: CLLocationCoordinate2D(latitude: 53.9025, longitude: 27.5618),
                title: "Оперный театр",
                description: "Один из красивейших театров Европы.",
                quest: QuestionQuest(
                    id: UUID(),
                    title: "Ария призрака",
                    description: "Кто является автором знаменитой оперы, исполняемой в этом театре?",
                    question: "Автор оперы 'Кармен'",
                    answers: ["Джузеппе Верди", "Вольфганг Амадей Моцарт", "Джордж Бизе", "Петр Чайковский"],
                    correctAnswer: "Джордж Бизе"
                )
            ),
            Route.RoutePoint(
                coordinate: CLLocationCoordinate2D(latitude: 53.9061, longitude: 27.5543),
                title: "Остров Слез",
                description: "Место, полное загадок и старых легенд.",
                quest: QuestionQuest(
                    id: UUID(),
                    title: "Легенда острова",
                    description: "По легенде, кого можно встретить на Острове Слез в полночь?",
                    question: "Кого можно встретить на Острове Слез?",
                    answers: ["Призрака", "Фею", "Дракона", "Русалку"],
                    correctAnswer: "Призрака"
                )
            )
        ]
    )
}



