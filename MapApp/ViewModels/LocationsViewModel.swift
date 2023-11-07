//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by Denis DRAGAN on 5.11.2023.
//

import Foundation
import SwiftUI
import MapKit

class LocationsViewModel: ObservableObject {
    // All loaded locations
    @Published var locations: [LocationModel]
    // Show the list of locations
    @Published var showLocationsList: Bool = false
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()

    // Current location on map
    @Published var mapLocation: LocationModel {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        // Initialize the map region
        self.updateMapRegion(location: locations.first!)
    }
    
    // Helper function to update the map region
    private func updateMapRegion(location: LocationModel) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: span)
        }
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }
    
    func showNextLocation(location: LocationModel) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func nextButtonPressed() {
        // Get the current index
        guard let currenIndex = locations.firstIndex(where: { $0 == mapLocation }) else { return }
        
        // Check if the nextIndex is valid
        let nextIndex = currenIndex + 1
        guard locations.indices.contains(nextIndex) else {
            // If nextIndex is not valid, restart index from 0
            guard let firsLocation = locations.first else { return }
            showNextLocation(location: firsLocation)
            return
        }
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
}
