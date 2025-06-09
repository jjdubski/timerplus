//
//  finalApp.swift
//  final
//
//  Created by Jacob Waksmanski on 6/5/25.
//

import SwiftUI

@main
struct finalApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
