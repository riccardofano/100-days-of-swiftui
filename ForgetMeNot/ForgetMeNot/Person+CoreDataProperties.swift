//
//  Person+CoreDataProperties.swift
//  ForgetMeNot
//
//  Created by Riccardo Fano on 2023-08-23.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    @NSManaged public var memory: Memory?

    var wrappedName: String {
        name ?? "Unknown name"
    }
}

extension Person : Identifiable {

}
