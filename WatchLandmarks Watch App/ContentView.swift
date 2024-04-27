//
//  ContentView.swift
//  WatchLandmarks Watch App
//
//  Created by Alizaenal Abidin on 27/04/24.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {

        LandmarkList()
            // task in main thread untuk meminta izin notifikasi secara asinkron
            .task {
                let center = UNUserNotificationCenter.current()
                _ = try? await center.requestAuthorization(
                    options: [.alert, .sound, .badge]
                )
            }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
