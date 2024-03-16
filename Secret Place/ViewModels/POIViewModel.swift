//
//  POIViewModel.swift
//  Secret Place
//
//  Created by 123 on 14.03.24.
//

import Foundation
import Combine
import CoreLocation

class POIViewModel: ObservableObject {
    @Published var pointsOfInterest = [
        POI(coordinate: CLLocationCoordinate2D(latitude: 53.9314742, longitude: 27.6435813), title: "Национальная библиотека Беларуси", snippet: "Знаковое здание в форме ромбокубоктаэдра"),
        // Другие места интереса
    ]
    
    // Здесь могут быть функции для добавления, удаления и обновления POI
}

