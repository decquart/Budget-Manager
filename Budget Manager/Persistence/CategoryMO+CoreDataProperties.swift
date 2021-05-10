//
//  CategoryMO+CoreDataProperties.swift
//  Budget Manager
//
//  Created by Volodymyr Myhailyuk on 25.04.2021.
//
//

import Foundation
import CoreData

extension CategoryMO {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoryMO> {
        return NSFetchRequest<CategoryMO>(entityName: "CategoryMO")
    }

    @NSManaged public var categoryName: String
    @NSManaged public var imageName: String
    @NSManaged public var transactions: NSSet?
}

// MARK: Generated accessors for transactions
extension CategoryMO {

    @objc(addTransactionsObject:)
    @NSManaged public func addToTransactions(_ value: TransactionMO)

    @objc(removeTransactionsObject:)
    @NSManaged public func removeFromTransactions(_ value: TransactionMO)

    @objc(addTransactions:)
    @NSManaged public func addToTransactions(_ values: NSSet)

    @objc(removeTransactions:)
    @NSManaged public func removeFromTransactions(_ values: NSSet)

}

extension CategoryMO : Identifiable {

}
