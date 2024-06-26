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
    var isFavorite: Bool
    var isFeatured: Bool
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
            case lakes = "Lakes"
            case rivers = "Rivers"
            case mountains = "Mountains"
    }
    
    // Solusi guna menyertakan sebuah component pada model
    private var imageName: String
    var image: Image { // clouse dengan return component `Image` SwiftUi
        Image(imageName)
    }
    
    // Load gambar pada local
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
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
