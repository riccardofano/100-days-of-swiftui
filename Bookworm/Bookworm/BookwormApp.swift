//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Riccardo Fano on 2023-08-03.
//

import SwiftUI

@main
struct BookwormApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
