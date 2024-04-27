//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Alizaenal Abidin on 25/04/24.
//

import SwiftUI

enum FilterCategory: String, CaseIterable, Identifiable {
    case all = "All"
    case lakes = "Lakes"
    case rivers = "Rivers"
    case mountains = "Mountains"
    
    var id: FilterCategory { self }
}

struct LandmarkList: View {
     
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    // Patokan category yang ditampilkan
    // default seluruh category ditampilkan
    @State private var filter = FilterCategory.all
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
               (!showFavoritesOnly || landmark.isFavorite) &&
            ( filter == .all || filter.rawValue == landmark.category.rawValue)
           }
       }

    // title sebagai refrensi terkini
    var title: String {
           let title = filter == .all ? "Landmarks" : filter.rawValue
           return showFavoritesOnly ? "Favorite \(title)" : title
       }
    
    var body: some View {

        NavigationSplitView {
            List {
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle(title)
            .frame(minWidth: 300)
            .toolbar {
                ToolbarItem{
                    Menu {
                        Picker("Category", selection: $filter) {
                            ForEach(FilterCategory.allCases) { category in
                                Text(category.rawValue).tag(category)
                            }
                        }
                        .pickerStyle(.inline)
                        Toggle(isOn: $showFavoritesOnly) {
                            Label("Favorites only", systemImage: "star.fill")
                        }
                    } label: {
                        Label("Filter", systemImage: "slider.horizontal.3")
                    }
                }
            }
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
        .environment(ModelData())
}
