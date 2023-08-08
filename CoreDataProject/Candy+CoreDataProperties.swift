//
//  Candy+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Riccardo Fano on 2023-08-08.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?
    
    public var wrappedName: String { name ?? "Unknown candy" }

}

extension Candy : Identifiable {

}
