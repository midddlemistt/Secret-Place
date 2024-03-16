//
//  RouteViewModel.swift
//  Secret Place
//
//  Created by 123 on 14.03.24.
//

import Combine
import CoreLocation
import GoogleMaps

class RouteViewModel: ObservableObject {
    @Published var routes: [Route] = [SampleData.sampleRoute] // Пример данных маршрута
    @Published var selectedRoute: Route? // Текущий выбранный маршрут
    @Published var showRouteDetails = false // Показывать ли детали маршрута
    @Published var routeStarted = false // Начат ли маршрут
    @Published var routeCompleted = false
    @Published var currentPointIndex: Int? = nil

    func startRoute() {
        routeStarted = true
        showRouteDetails = false
        currentPointIndex = 0 
    }

    func endRoute() {
        routeStarted = false
        selectedRoute = nil
        routeCompleted = true
    }

    func addRoute(route: Route) {
        routes.append(route)
    }

    func selectRoute(withID id: UUID) {
        selectedRoute = routes.first { $0.id == id }
    }

    func toggleRouteDetails() {
        showRouteDetails.toggle()
        if !showRouteDetails {
            selectedRoute = nil // Сбрасываем выбранный маршрут при закрытии деталей
        }
    }
    
    func reachNextPoint() {
            guard let route = selectedRoute, let index = currentPointIndex else { return }
            
            if index < route.points.count - 1 {
                // Есть еще точки в маршруте
                currentPointIndex! += 1
            } else {
                // Последняя точка маршрута достигнута, завершаем маршрут
                endRoute()
            }
        }
    
    func setupMarkers(in mapView: GMSMapView) {
        mapView.clear() // Очистка карты от предыдущих маркеров
        for route in routes {
            let marker = GMSMarker(position: route.points.first?.coordinate ?? CLLocationCoordinate2D())
            marker.userData = route.id
            marker.icon = GMSMarker.markerImage(with: .blue) // Установка цвета маркера
            marker.map = mapView
        }
    }


    // Управление отображением маршрута на карте
    func setupRoute(in mapView: GMSMapView) {
        guard let route = selectedRoute else { return }
        mapView.clear() // Очистка карты

        let path = GMSMutablePath()
        for point in route.points {
            path.add(point.coordinate)
            let marker = GMSMarker(position: point.coordinate)
            marker.map = mapView
        }

        let polyline = GMSPolyline(path: path)
        polyline.strokeColor = .blue
        polyline.strokeWidth = 5.0
        polyline.map = mapView
    }

    func clearMap(in mapView: GMSMapView) {
        mapView.clear()
    }

    // Здесь могут быть дополнительные методы для управления маршрутами
}


