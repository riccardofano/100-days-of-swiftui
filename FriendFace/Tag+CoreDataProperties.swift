//
//  Tag+CoreDataProperties.swift
//  FriendFace
//
//  Created by Riccardo Fano on 2023-08-09.
//
//

import Foundation
import CoreData


extension Tag {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tag> {
        return NSFetchRequest<Tag>(entityName: "Tag")
    }

    @NSManaged public var name: String?
    @NSManaged public var user: CachedUser?

    public var wrappedName: String {
        name ?? "Unknown tag"
    }
}

extension Tag : Identifiable {

}
