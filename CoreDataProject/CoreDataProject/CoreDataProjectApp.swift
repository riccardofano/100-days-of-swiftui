//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Riccardo Fano on 2023-08-07.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
