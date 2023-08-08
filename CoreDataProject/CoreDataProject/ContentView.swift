//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Riccardo Fano on 2023-08-07.
//

import SwiftUI

struct Student: Hashable {
    let name: String
}

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    // %@ is used as a placeholder for variables
//    static let predicate = NSPredicate(format: "universe == %@", "Star Trek")
//    static let predicate = NSPredicate(format: "universe IN %@", ["Aliens", "Firefly", "Star Trek"])
//    static let predicate = NSPredicate(format: "name BEGINSWITH %@", "E")
//    static let predicate = NSPredicate(format: "name BEGINSWITH[c] %@", "e")
//    static let predicate = NSPredicate(format: "NOT name BEGINSWITH[c] %@", "e")
//    static let predicate = NSPredicate(format: "NOT name BEGINSWITH[c] %@ AND universe == %@", "e", "Star Wars")
//
//    @FetchRequest(sortDescriptors: [], predicate: predicate) var ships: FetchedResults<Ship>
    
    @State private var lastNameFilter = "A"
    
    var body: some View {
        VStack {
            FilteredList(filter: lastNameFilter)
            
            Button("Add examples") {
                let taylor = Singer(context: moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"

                let ed = Singer(context: moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"

                let adele = Singer(context: moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"

                try? moc.save()
            }
            
            Button("Show A") {
                lastNameFilter = "A"
            }
            
            Button("Show S") {
                lastNameFilter = "S"
            }
        }
//        List(ships, id: \.self) { ship in
//            Text(ship.name ?? "Unknown name")
//        }
//
//        Button("Add Examples") {
//            let ship1 = Ship(context: moc)
//            ship1.name = "Enterprise"
//            ship1.universe = "Star Trek"
//
//            let ship2 = Ship(context: moc)
//            ship2.name = "Defiant"
//            ship2.universe = "Star Trek"
//
//            let ship3 = Ship(context: moc)
//            ship3.name = "Millennium Falcon"
//            ship3.universe = "Star Wars"
//
//            let ship4 = Ship(context: moc)
//            ship4.name = "Executor"
//            ship4.universe = "Star Wars"
//
//            try? moc.save()
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
