//
//  Landmark.swift
//  Landmarky
//
//  Created by Patrik Cesnek on 26/08/2020.
//  Copyright © 2020 Patrik Cesnek. All rights reserved.
//

import SwiftUI
import CoreLocation


struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var city: String
    var place: String
    var category: Category
    var isFavorite: Bool
    var isFeatured: Bool
    var description: String


    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    var featureImage: Image? {
        guard isFeatured else { return nil }
        
        return Image(
            ImageStore.loadImage(name: "\(imageName)_feature"),
            scale: 2,
            label: Text(name))
    }

    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Vybrané"
        case lakes = "Jazerá"
        case waterfalls = "Vodopády"
        case mountains = "Vrchy"
        case caves = "Jaskyne"
    }
}

extension Landmark {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}




