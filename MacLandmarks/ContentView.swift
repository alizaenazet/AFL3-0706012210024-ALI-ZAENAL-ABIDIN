//
//  ContentView.swift
//  MacLandmarks
//
//  Created by Alizaenal Abidin on 27/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
            .frame(minWidth: 700, minHeight: 300)
    }
}



#Preview {
    ContentView()
        .environment(ModelData())
}
