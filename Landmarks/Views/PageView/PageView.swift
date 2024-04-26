//
//  PageView.swift
//  Landmarks
//
//  Created by Alizaenal Abidin on 26/04/24.
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 2
    var body: some View {
        PageViewController(pages: pages,currentPage: $currentPage)
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}

#Preview {
    PageView(
        pages: ModelData().features.map {
            FeatureCard(landmark: $0)
        }
    )
}
