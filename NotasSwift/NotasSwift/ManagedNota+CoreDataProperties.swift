//
//  ManagedNota+CoreDataProperties.swift
//  NotasSwift
//
//  Created by Jose on 10/03/23.
//
//

import Foundation
import CoreData


extension ManagedNota {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ManagedNota> {
        return NSFetchRequest<ManagedNota>(entityName: "Nota")
    }

    @NSManaged public var date: Date?
    @NSManaged public var message: String?

}

extension ManagedNota : Identifiable {

}

struct Nota {
    var message : String
    var date : Date
}
