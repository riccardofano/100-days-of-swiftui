//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Riccardo Fano on 2023-08-08.
//

import SwiftUI

@main
struct FriendFaceApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
