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
                quest: Quest(
                    id: UUID(),
                    title: "Тайна площади",
                    description: "Найдите символ свободы, который виден только отважным."
                )
            ),
            Route.RoutePoint(
                coordinate: CLLocationCoordinate2D(latitude: 53.8986, longitude: 27.5623),
                title: "Городская Ратуша",
                description: "Историческое здание с богатой историей.",
                quest: Quest(
                    id: UUID(),
                    title: "Загадка Ратуши",
                    description: "Раскройте тайны прошлого, найдя скрытый послание мэра."
                )
            ),
            Route.RoutePoint(
                coordinate: CLLocationCoordinate2D(latitude: 53.9025, longitude: 27.5618),
                title: "Оперный театр",
                description: "Один из красивейших театров Европы.",
                quest: Quest(
                    id: UUID(),
                    title: "Ария призрака",
                    description: "Найдите записку, оставленную последним оперным призраком."
                )
            ),
            Route.RoutePoint(
                coordinate: CLLocationCoordinate2D(latitude: 53.9061, longitude: 27.5543),
                title: "Остров Слез",
                description: "Место, полное загадок и старых легенд.",
                quest: Quest(
                    id: UUID(),
                    title: "Легенда острова",
                    description: "Отыщите древний символ, укрытый среди исторических руин."
                )
            )
        ]
    )

    // Дополнительные примеры данных по мере необходимости
}


