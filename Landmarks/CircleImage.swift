//
//  CircleImage.swift
//  Landmarks
//
//  Created by Alizaenal Abidin on 25/04/24.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.pink, lineWidth: 4)
            }
            .shadow(color: .red, radius: 14)
    }
}

#Preview {
    CircleImage(image: Image("turtlerock"))
}
