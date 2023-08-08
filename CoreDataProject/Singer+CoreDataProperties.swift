//
//  Singer+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Riccardo Fano on 2023-08-08.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?

    var wrappedFirstName: String { firstName ?? "Unknown" }
    var wrappedLastName: String { lastName ?? "Unknown" }
}

extension Singer : Identifiable {

}
