//
//  ToDoListitem+CoreDataProperties.swift
//  homeWork14
//
//  Created by Антон Михнюкевич on 24.01.2023.
//
//

import Foundation
import CoreData


extension ToDoListitem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListitem> {
        return NSFetchRequest<ToDoListitem>(entityName: "ToDoListitem")
    }

    @NSManaged public var createdAT: Date?
    @NSManaged public var name: String?

}

extension ToDoListitem : Identifiable {

}
