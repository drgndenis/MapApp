//
//  MapAppApp.swift
//  MapApp
//
//  Created by Denis DRAGAN on 1.11.2023.
//

import SwiftUI

@main
struct MapAppApp: App {
    @StateObject private var vm = LocationsViewModel()
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
