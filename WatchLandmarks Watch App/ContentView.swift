//
//  ContentView.swift
//  WatchLandmarks Watch App
//
//  Created by Alizaenal Abidin on 27/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
