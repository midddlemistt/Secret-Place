//
//  MapCoordinator.swift
//  Secret Place
//
//  Created by 123 on 16.03.24.
//

import Foundation
import GoogleMaps

class MapCoordinator: NSObject, GMSMapViewDelegate {
    var viewModel: RouteViewModel
    
    init(viewModel: RouteViewModel) {
        self.viewModel = viewModel
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        if let routeID = marker.userData as? UUID {
            viewModel.selectRoute(withID: routeID)
            viewModel.showRouteDetails = true // Убедитесь, что это свойство изменяется
        }
        return true
    }


    // Метод для установки начальных маркеров маршрута
    func setupMarkers(in mapView: GMSMapView) {
        viewModel.setupMarkers(in: mapView)
    }
}

