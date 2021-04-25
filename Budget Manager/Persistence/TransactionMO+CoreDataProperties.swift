//
//  TransactionMO+CoreDataProperties.swift
//  Budget Manager
//
//  Created by Volodymyr Myhailyuk on 25.04.2021.
//
//

import Foundation
import CoreData

extension TransactionMO {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<TransactionMO> {
        return NSFetchRequest<TransactionMO>(entityName: "TransactionMO")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var amount: Float
    @NSManaged public var createdAt: Date?
    @NSManaged public var photo: Data?
    @NSManaged public var category: CategoryMO?
}

extension TransactionMO : Identifiable {

}
