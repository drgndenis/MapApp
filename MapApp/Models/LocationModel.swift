//
//  LocationModel.swift
//  MapApp
//
//  Created by Denis DRAGAN on 2.11.2023.
//

import Foundation
import MapKit

struct LocationModel: Identifiable, Equatable {
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    var id: String {
        name + cityName
    }
    
    static func == (lhs: LocationModel, rhs: LocationModel) -> Bool {
        lhs.id == rhs.id
    }

}
