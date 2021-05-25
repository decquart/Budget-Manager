//
//  TransactionRepository.swift
//  Budget Manager
//
//  Created by Volodymyr Myhailyuk on 24.05.2021.
//

import Foundation
import Combine

final class TransactionRepository: Repository {
	private let cdStack = CoreDataStack.shared

	func get(by predicate: NSPredicate) -> AnyPublisher<[Transaction], Error> {
		Just(TransactionMO.fetchRequest())
			.handleEvents(receiveOutput: { fetchRequest in
				fetchRequest.predicate = predicate
			})
			.tryMap(cdStack.mainContext.fetch)
			.map { $0.compactMap { ($0 as? TransactionMO)?.toModel } }
			.eraseToAnyPublisher()
	}

	func getAll() -> AnyPublisher<[Transaction], Error> {
		Just(TransactionMO.fetchRequest())
			.tryMap(cdStack.mainContext.fetch)
			.map { $0.compactMap { $0.toModel } }
			.eraseToAnyPublisher()
	}

	func add(_ item: Transaction) -> AnyPublisher<Void, Error> {
		Just(TransactionMO(context: cdStack.mainContext))
			.handleEvents(receiveOutput: {
				$0.map(from: item)
			})
			.tryMap { [weak self] _ in
				try self?.cdStack.saveContext()
			}
			.eraseToAnyPublisher()
	}

	func update(_ item: Transaction) -> AnyPublisher<Void, Error> {
		tryFetch(by: item.id)
			.handleEvents(receiveOutput: {
				$0.map(from: item)
			})
			.tryMap { [weak self] arg in
				try self?.cdStack.saveContext()
			}
			.eraseToAnyPublisher()
	}

	func delete(_ item: Transaction) -> AnyPublisher<Void, Error> {
		tryFetch(by: item.id)
			.tryMap(cdStack.mainContext.delete(_:))
			.tryMap(cdStack.saveContext)
			.eraseToAnyPublisher()
	}

	private func tryFetch(by id: UUID) -> AnyPublisher<TransactionMO, Error> {
		Just(TransactionMO.fetchRequest())
			.handleEvents(receiveOutput: {
				$0.predicate = NSPredicate(format: "id = %@", id as CVarArg)
			})
			.tryCompactMap { [weak self] in
				try self?.cdStack.mainContext.fetch($0).first
			}
			.eraseToAnyPublisher()
	}
}
