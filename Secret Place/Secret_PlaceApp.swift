//
//  Secret_PlaceApp.swift
//  Secret Place
//
//  Created by 123 on 14.03.24.
//

import SwiftUI
import GoogleMaps

@main
struct Secret_PlaceApp: App {
    
    init() {
        GMSServices.provideAPIKey("AIzaSyDVzrn-ve0Rl4EmFDpmRT0dxmw5NKXZ1UE")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
