//
//  MiniMapView.swift
//  Secret Place
//
//  Created by 123 on 15.03.24.
//

import SwiftUI
import GoogleMaps

struct MiniMapView: UIViewRepresentable {
    var route: Route

    func makeUIView(context: Context) -> GMSMapView {
        let mapView = GMSMapView()
        
        // установка камеры
        if let firstPoint = route.points.first {
            let camera = GMSCameraPosition.camera(withTarget: firstPoint.coordinate, zoom: 14)
            mapView.camera = camera
        }

        // Добавление маркеров для точек маршрута
        for point in route.points {
            let marker = GMSMarker(position: point.coordinate)
            marker.title = point.title
            marker.map = mapView
        }

        let path = GMSMutablePath()
        route.points.forEach { path.add($0.coordinate) }
        let polyline = GMSPolyline(path: path)
        polyline.map = mapView

        return mapView
    }

    func updateUIView(_ uiView: GMSMapView, context: Context) {
        // Обновление вью при необходимости
    }
}


#Preview {
    MiniMapView(route: SampleData.sampleRoute)
}
