//
//  Landmark.swift
//  LandMarks
//
//  Created by 최수훈 on 9/23/24.
//
import Foundation
import SwiftUI
import CoreLocation

// The Landmark data already has the id property required by Identifiable protocol; you only need to add a property to decode it when reading the data.

struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool

    // property to read the name of the image from the data
    // You make the property private because users of the Landmarks structure care only about the image itself.
    private var imageName: String
    var image: Image {
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
