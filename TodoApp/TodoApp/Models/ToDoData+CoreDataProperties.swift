//
//  ToDoData+CoreDataProperties.swift
//  TodoApp
//
//  Created by 정우찬 on 2024/01/22.
//
//

import Foundation
import CoreData


extension ToDoData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoData> {
        return NSFetchRequest<ToDoData>(entityName: "ToDoData")
    }

    @NSManaged public var memoText: String?
    @NSManaged public var date: Date?
    @NSManaged public var color: Int16

}

extension ToDoData : Identifiable {

}
