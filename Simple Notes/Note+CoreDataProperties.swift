//
//  Note+CoreDataProperties.swift
//  Simple Notes
//
//  Created by Karl J. Villeneuve on 2017-04-13.
//  Copyright © 2017 Winnicki. All rights reserved.
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note");
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var id: Int16
    @NSManaged public var passwordProtected: Bool
    @NSManaged public var title: String?
    @NSManaged public var type: NSObject?
    @NSManaged public var authentication: Authentication?

}
