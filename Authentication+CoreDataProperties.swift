//
//  Authentication+CoreDataProperties.swift
//  Simple Notes
//
//  Created by Karl J. Villeneuve on 2017-04-13.
//  Copyright © 2017 Winnicki. All rights reserved.
//

import Foundation
import CoreData


extension Authentication {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Authentication> {
        return NSFetchRequest<Authentication>(entityName: "Authentication");
    }

    @NSManaged public var question: String?
    @NSManaged public var answer: String?
    @NSManaged public var password: String?
    @NSManaged public var note: NSSet?

}

// MARK: Generated accessors for note
extension Authentication {

    @objc(addNoteObject:)
    @NSManaged public func addToNote(_ value: Note)

    @objc(removeNoteObject:)
    @NSManaged public func removeFromNote(_ value: Note)

    @objc(addNote:)
    @NSManaged public func addToNote(_ values: NSSet)

    @objc(removeNote:)
    @NSManaged public func removeFromNote(_ values: NSSet)

}
