    //
    //  LocationsListView.swift
    //  MapApp
    //
    //  Created by Denis DRAGAN on 6.11.2023.
    //

    import SwiftUI

    struct LocationsListView: View {
        @EnvironmentObject private var vm: LocationsViewModel
        
        var body: some View {
            List {
                ForEach(vm.locations) { location in
                    Button(action: {
                        vm.showNextLocation(location: location)
                    }, label: {
                        listRowView(location: location)
                    })
                    .padding(.vertical, 4)
                    .listRowBackground(Color.clear)
                }
            }
            .listStyle(.plain)
        }
    }

    #Preview {
        LocationsListView()
            .environmentObject(LocationsViewModel())
    }

    extension LocationsListView {
        private func listRowView(location: LocationModel) -> some View {
            HStack {
                if let imageName = location.imageNames.first {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 45, height: 45)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                VStack(alignment: .leading) {
                    Text(location.cityName)
                        .font(.headline)
                    Text(location.name)
                        .font(.subheadline)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
