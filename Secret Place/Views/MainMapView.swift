//
//  MainMapView.swift
//  Secret Place
//
//  Created by 123 on 14.03.24.
//

import SwiftUI
import GoogleMaps

struct MainMapView: UIViewRepresentable {
    @ObservedObject var viewModel: RouteViewModel
    let minskCoordinates = CLLocationCoordinate2D(latitude: 53.9006, longitude: 27.5590)
    
    func makeCoordinator() -> MapCoordinator {
        MapCoordinator(viewModel: viewModel)
    }
    
    func makeUIView(context: Context) -> GMSMapView {
        // Начальная камера установлена на Минске
        let camera = GMSCameraPosition.camera(withTarget: minskCoordinates, zoom: 12)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.delegate = context.coordinator
        context.coordinator.setupMarkers(in: mapView)
        mapView.isMyLocationEnabled = true
        
        return mapView
    }
    
    func updateUIView(_ uiView: GMSMapView, context: Context) {
        if viewModel.routeStarted {
            viewModel.setupRoute(in: uiView)
        } else {
            context.coordinator.setupMarkers(in: uiView)
        }
    }
    
    
}

//#Preview {
//    MainMapView(viewModel: RouteViewModel())
//}
