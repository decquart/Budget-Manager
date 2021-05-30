//
//  TransactionsViewModel.swift
//  Budget Manager
//
//  Created by Volodymyr Myhailyuk on 26.04.2021.
//

import Foundation
import Combine

final class TransactionsViewModel<CategoryRepositoryType, TransactionsRepositoryType>: ObservableObject where
	CategoryRepositoryType: Repository,
	TransactionsRepositoryType: Repository,
	CategoryRepositoryType.Item == Category,
	TransactionsRepositoryType.Item == Transaction
{
	let categoryRepo: CategoryRepositoryType
	let transactionsRepo: TransactionsRepositoryType
	private var bag = Set<AnyCancellable>()

	init(categoryRepo: CategoryRepositoryType, transactionsRepo: TransactionsRepositoryType) {
		self.categoryRepo = categoryRepo
		self.transactionsRepo = transactionsRepo
	}

	func add(transaction: Transaction) {
		transactionsRepo
			.add(transaction)
			.sink { _ in
				print("completed")
			} receiveValue: { value in
				print("val \(value)")
			}
			.store(in: &bag)
	}
}
