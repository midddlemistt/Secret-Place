//
//  DirectionsAPI.swift
//  Secret Place
//
//  Created by 123 on 14.03.24.
//

import Alamofire
import CoreLocation

struct DirectionsAPI {
    static func fetchRoute(from origin: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D, completion: @escaping (Result<String, Error>) -> Void) {
        let urlString = "https://maps.googleapis.com/maps/api/directions/json"
        let parameters: [String: Any] = [
            "origin": "\(origin.latitude),\(origin.longitude)",
            "destination": "\(destination.latitude),\(destination.longitude)",
            "key": "AIzaSyDVzrn-ve0Rl4EmFDpmRT0dxmw5NKXZ1UE"
        ]
        
        AF.request(urlString, method: .get, parameters: parameters).responseJSON { response in
            switch response.result {
            case .success(let value):
                // Обработка успешного ответа
                if let json = value as? [String: Any], let routes = json["routes"] as? [Any], let firstRoute = routes.first as? [String: Any], let overviewPolyline = firstRoute["overview_polyline"] as? [String: Any], let points = overviewPolyline["points"] as? String {
                    completion(.success(points))
                } else {
                    completion(.failure(NSError(domain: "DirectionsAPI", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to parse directions response"])))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

