//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Alizaenal Abidin on 25/04/24.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
            List(landmarks) { landmark in
                LandmarkRow(landmark: landmark)
            }
        }
}

#Preview {
    LandmarkList()
}
