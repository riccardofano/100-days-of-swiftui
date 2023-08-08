//
//  Country+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Riccardo Fano on 2023-08-08.
//
//

import Foundation
import CoreData


extension Country {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Country> {
        return NSFetchRequest<Country>(entityName: "Country")
    }

    @NSManaged public var name: String?
    @NSManaged public var shortName: String?
    @NSManaged public var candy: NSSet?
    
    public var wrappedName: String { name ?? "Unknown country" }
    public var wrappedShortName: String { shortName ?? "Unknown country" }
    public var candyList: [Candy] {
        let set = candy as? Set<Candy> ?? []
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
    
}

// MARK: Generated accessors for candy
extension Country {

    @objc(addCandyObject:)
    @NSManaged public func addToCandy(_ value: Candy)

    @objc(removeCandyObject:)
    @NSManaged public func removeFromCandy(_ value: Candy)

    @objc(addCandy:)
    @NSManaged public func addToCandy(_ values: NSSet)

    @objc(removeCandy:)
    @NSManaged public func removeFromCandy(_ values: NSSet)

}

extension Country : Identifiable {

}
