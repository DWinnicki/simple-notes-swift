//
//  Note+CoreDataProperties.swift
//  Simple Notes
//
//  Created by Karl J. Villeneuve on 2017-04-14.
//  Copyright © 2017 Winnicki. All rights reserved.
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note");
    }

    @NSManaged public var date: NSDate?
    @NSManaged public var id: String?
    @NSManaged public var title: String?
    @NSManaged public var type: String?
    @NSManaged public var authentication: Authentication?
    
    public func getDate() -> String {
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = DateFormatter.Style.short
        dateformatter.timeStyle = DateFormatter.Style.short
        let dateStr = dateformatter.string(from: date as! Date)
        return dateStr
    }

}
