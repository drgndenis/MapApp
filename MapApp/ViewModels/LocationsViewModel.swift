//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by Denis DRAGAN on 5.11.2023.
//

import Foundation

class LocationsViewModel: ObservableObject {
    @Published var locations: [LocationModel]
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
}
