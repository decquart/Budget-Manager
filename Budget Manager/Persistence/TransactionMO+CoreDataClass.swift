//
//  TransactionMO+CoreDataClass.swift
//  Budget Manager
//
//  Created by Volodymyr Myhailyuk on 25.04.2021.
//
//

import Foundation
import CoreData

@objc(TransactionMO)
public class TransactionMO: NSManagedObject {

}

extension TransactionMO {
	var toModel: Transaction {
		Transaction(
			id: id,
			amount: amount,
			createdAt: createdAt,
			photoData: photo
		)
	}

	func map(from model: Transaction) {
		self.id = model.id
		self.amount = model.amount
		self.createdAt = model.createdAt
		self.photo = model.photoData
	}
}
