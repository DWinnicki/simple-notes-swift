//
//  Note+CoreDataProperties.swift
//  Simple Notes
//
//  Created by Karl J. Villeneuve on 2017-04-15.
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
    @NSManaged public var passwordProtected: Bool
    @NSManaged public var authentication: Authentication?

    
    public func getDate() -> String {
        let dateformatter = DateFormatter()
        dateformatter.locale = Locale(identifier: "en_US")
        dateformatter.dateStyle = DateFormatter.Style.medium
        let dateStr = dateformatter.string(from: date as! Date)
        return dateStr
    }
    
    public func getFullDate() -> String {
        let dateformatter = DateFormatter()
        dateformatter.locale = Locale(identifier: "en_US")
        dateformatter.timeStyle = DateFormatter.Style.short
        dateformatter.dateStyle = DateFormatter.Style.medium
        let dateStr = dateformatter.string(from: date as! Date)
        return dateStr
    }
    
    public func isPasswordProtected() -> Bool{
        return passwordProtected
    }
    
}
