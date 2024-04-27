//
//  LandmarkCommands.swift
//  Landmarks
//
//  Created by Alizaenal Abidin on 27/04/24.
//

import SwiftUI



struct LandmarkCommands: Commands {
    @FocusedBinding(\.selectedLandmark) var selectedLandmark
    
    var body: some Commands {
        // swiftui built-in component
        SidebarCommands()
        
        CommandMenu("Landmark") {
            // reference into current selected landmark untuk menentukan teks pada button
            Button("\(selectedLandmark?.isFavorite == true ? "Remove" : "Mark") as Favorite") {
                selectedLandmark?.isFavorite.toggle()
            }
            // menambahkan shortcut untuk keyboard pada apliaksi di mac
            .keyboardShortcut("f", modifiers: [.shift, .option])
            .disabled(selectedLandmark == nil)
        }
    }
}

private struct SelectedLandmarkKey: FocusedValueKey {
    typealias Value = Binding<Landmark>
}



extension FocusedValues {
    var selectedLandmark: Binding<Landmark>? {
        get { self[SelectedLandmarkKey.self] }
        set { self[SelectedLandmarkKey.self] = newValue }
    }
}
