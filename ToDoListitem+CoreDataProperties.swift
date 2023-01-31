//
//  ToDoListitem+CoreDataProperties.swift
//  
//
//  Created by Антон Михнюкевич on 05.12.2022.
//
//

import Foundation
import CoreData


extension ToDoListitem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListitem> {
        return NSFetchRequest<ToDoListitem>(entityName: "ToDoListitem")
    }

    @NSManaged public var name: String?
    @NSManaged public var createdAT: Date?

}
