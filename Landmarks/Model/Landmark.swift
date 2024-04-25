//
//  Landmark.swift
//  Landmarks
//
//  Created by Alizaenal Abidin on 25/04/24.
//

import Foundation
import SwiftUI
import CoreLocation //

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var state: String
    var park: String
    var description: String
    
    // Solusi guna menyertakan sebuah component pada model
    private var imageName: String
    var image: Image { // clouse dengan return component `Image` SwiftUi
        Image(imageName)
    }
    
    private var coordinates: Coordinates

    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }

}
