//
//  Route.swift
//  Secret Place
//
//  Created by 123 on 14.03.24.
//

import Foundation
import CoreLocation

struct Route {
    let id: UUID // Уникальный идентификатор маршрута
    let name: String // Название маршрута
    let description: String // Описание маршрута
    let points: [RoutePoint] // Массив точек маршрута

    struct RoutePoint {
        let coordinate: CLLocationCoordinate2D // Координаты точки
        let title: String // Название точки
        let description: String // Описание точки
        let quest: Quest? // Опциональный квест для этой точки
    }
}

