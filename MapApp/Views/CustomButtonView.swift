//
//  CustomButtonView.swift
//  MapApp
//
//  Created by Denis DRAGAN on 6.11.2023.
//

import SwiftUI

struct CustomButtonView: View {
    let buttonName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            self.action()
        }, label: {
            Text(buttonName)
                .font(.headline)
                .frame(width: 125, height: 35)
        })
    }
}

#Preview {
    CustomButtonView(buttonName: "Test", action: {
        
    })
    .buttonStyle(.borderedProminent)
}
