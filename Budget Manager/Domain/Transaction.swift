//
//  Transaction.swift
//  Budget Manager
//
//  Created by Volodymyr Myhailyuk on 24.05.2021.
//

import Foundation

struct Transaction {
	let id: UUID
	let amount: Float
	let createdAt: Date
	let photoData: Data?
}
