//
//  finalApp.swift
//  final
//
//  Created by Jacob Waksmanski on 6/5/25.
//

import SwiftUI

@main
struct timerplus: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var timerSettings = TimerSettings()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(timerSettings)
        }
    }
}
