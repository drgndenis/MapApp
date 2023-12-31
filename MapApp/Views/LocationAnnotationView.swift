//
//  LocationAnnotationView.swift
//  MapApp
//
//  Created by Denis DRAGAN on 7.11.2023.
//

import SwiftUI

struct LocationAnnotationView: View {
    let accentColor = Color("AccentColor")
    var body: some View {
        VStack(spacing: 0.0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 30,height: 30)
                .font(.headline)
                .foregroundColor(.white)
                .padding(6)
                .background(accentColor)
                .cornerRadius(36)
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 10,height: 10)
                .foregroundColor(accentColor)
                .rotationEffect(Angle(degrees: 180))
                .offset(y : -3)
                .padding(.bottom ,40)
        }
    }
}

#Preview {
    LocationAnnotationView()
}
