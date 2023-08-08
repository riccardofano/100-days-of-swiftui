//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Riccardo Fano on 2023-08-08.
//

import SwiftUI
import CoreData

struct FilteredList<T: NSManagedObject, Content: View>: View {
    let content: (T) -> Content
    @FetchRequest var fetchRequest: FetchedResults<T>
    
    init(keyFilter: String, valueFilter: String, @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(
            sortDescriptors: [],
            // %K is how you specify a k, it's not surrounded by quotes like %@
            predicate: NSPredicate(format: "%K BEGINSWITH %@", keyFilter, valueFilter)
        )
        self.content = content
    }
    
    var body: some View {
        List(fetchRequest, id: \.self) { entity in
            self.content(entity)
        }
    }
}
