//
//  LocationPreviewView.swift
//  MapApp
//
//  Created by Denis DRAGAN on 6.11.2023.
//

import SwiftUI

struct LocationPreviewView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    let location: LocationModel
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            
            VStack(alignment: .leading ,spacing: 16) {
                imageSection
                titleSection
            }
            
            VStack(spacing: 8) {
                // Learn More Button
                CustomButtonView(buttonName: "Learn More", action: {
                })
                    .buttonStyle(.borderedProminent)
                // Next Button
                CustomButtonView(buttonName: "Next", action: {
                    vm.nextButtonPressed()
                })
                    .buttonStyle(.bordered)
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    ZStack {
        Color.yellow
        LocationPreviewView(location: LocationsDataService.locations.first!)
    }.ignoresSafeArea()
}

extension LocationPreviewView {
    
    private var imageSection: some View {
        ZStack {
            if let imageNames = location.imageNames.first {
                Image(imageNames)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding(6)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.title)
                .bold()
            Text(location.cityName)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
