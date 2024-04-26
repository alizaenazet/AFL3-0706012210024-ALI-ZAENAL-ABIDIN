//
//  FeatureCard.swift
//  Landmarks
//
//  Created by Alizaenal Abidin on 26/04/24.
//

import SwiftUI

struct FeatureCard: View {
    var landmark: Landmark
    
    var body: some View {
        
        landmark.featureImage?
            .resizable()
            .overlay {
                TextOverlay(
                    name: landmark.name,
                    park: landmark.park
                )
            }
       }
}

struct TextOverlay: View {
    let name: String
    let park: String

    // Modifier untuk shape/component sehingga menjadi lebih gelap pada bagian bawah
    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient

            VStack(alignment: .leading) {
                Text(name)
                    .font(.title)
                    .bold()
                Text(park)
            }
            .padding()
            
        }
        .foregroundStyle(.white)
    }
}

#Preview {
    FeatureCard(landmark: ModelData().features[0])
        .aspectRatio(3 / 2, contentMode: .fit)
}
