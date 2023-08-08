//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Riccardo Fano on 2023-08-08.
//

import SwiftUI
import CoreData

enum SearchPredicate: String {
    // [c] makes the search case insensitive
    case beginsWith = "BEGINSWITH[c]"
    case endsWith = "ENDSWITH[c]"
    case equals = "==[c]"
    
}

struct FilteredList<T: NSManagedObject, Content: View>: View {
    let content: (T) -> Content
    var query = ""
    
    @FetchRequest var fetchRequest: FetchedResults<T>
    
    init(keyFilter: String,
        predicate: SearchPredicate,
        valueFilter: String,
        sort: [SortDescriptor<T>] = [],
        @ViewBuilder content: @escaping (T) -> Content
   ) {
        _fetchRequest = FetchRequest<T>(
            sortDescriptors: sort,
            // %K is how you specify a k, it's not surrounded by quotes like %@
            predicate: NSPredicate(format: "%K \(predicate.rawValue) %@", keyFilter, valueFilter)
        )
        self.content = content
        self.query = "\(keyFilter) \(predicate.rawValue) '\(valueFilter)'"
    }
    
    var body: some View {
        VStack {
            Text(query)
            List(fetchRequest, id: \.self) { entity in
                self.content(entity)
            }
        }
    }
}
