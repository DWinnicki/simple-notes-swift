//
//  TextNote+CoreDataProperties.swift
//  Simple Notes
//
//  Created by Karl J. Villeneuve on 2017-04-13.
//  Copyright © 2017 Winnicki. All rights reserved.
//

import Foundation
import CoreData


extension TextNote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TextNote> {
        return NSFetchRequest<TextNote>(entityName: "TextNote");
    }

    @NSManaged public var text: String?

}
