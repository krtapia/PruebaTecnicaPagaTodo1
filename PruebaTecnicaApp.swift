//
//  PruebaTecnicaApp.swift
//  PruebaTecnica
//
//  Created by HLS GROUP on 31/05/23.
//

import SwiftUI

@main
struct PruebaTecnicaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
