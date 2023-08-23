//
//  Memory+CoreDataProperties.swift
//  ForgetMeNot
//
//  Created by Riccardo Fano on 2023-08-23.
//
//

import Foundation
import CoreData
import SwiftUI


extension Memory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Memory> {
        return NSFetchRequest<Memory>(entityName: "Memory")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var tagged: NSSet?
    
    var image: UIImage? {
        guard let id = id else {
            return nil
        }
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let path = paths[0]
        
        let imageUrl = path.appendingPathComponent("\(id).jpg")
        let image = UIImage(contentsOfFile: imageUrl.path)
        return image
    }
    
    var taggedList: [Person] {
        let set = tagged as? Set<Person> ?? []
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }

    var wrappedName: String {
        name ?? "Unknown memory"
    }
}

// MARK: Generated accessors for tagged
extension Memory {

    @objc(addTaggedObject:)
    @NSManaged public func addToTagged(_ value: Person)

    @objc(removeTaggedObject:)
    @NSManaged public func removeFromTagged(_ value: Person)

    @objc(addTagged:)
    @NSManaged public func addToTagged(_ values: NSSet)

    @objc(removeTagged:)
    @NSManaged public func removeFromTagged(_ values: NSSet)

}

extension Memory : Identifiable {

}
