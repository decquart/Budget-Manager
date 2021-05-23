//
//  CategoryRepository.swift
//  Budget Manager
//
//  Created by Volodymyr Myhailyuk on 27.04.2021.
//

import Foundation
import Combine
import CoreData

final class CategoryRepository: Repository {
	private let cdStack = CoreDataStack.shared
	private var fetchRequest: NSFetchRequest<CategoryMO> {
		return NSFetchRequest<CategoryMO>(entityName: "CategoryMO")
	}

	func get(by predicate: NSPredicate) -> AnyPublisher<[Category], Error> {
		Just(CategoryMO.fetchRequest())
			.handleEvents(receiveOutput: { fetchRequest in
				fetchRequest.predicate = predicate
			})
			.tryMap(cdStack.mainContext.fetch)
			.map { $0.compactMap { $0 as? Category } }
			.eraseToAnyPublisher()
	}

	func getAll() -> AnyPublisher<[Category], Error> {

		Just(fetchRequest)
			.tryMap(cdStack.mainContext.fetch)
			.map { $0.compactMap { $0.toModel } }
			.eraseToAnyPublisher()
	}

	func add(_ item: Category) -> AnyPublisher<Void, Error> {
		Just(CategoryMO(context: cdStack.mainContext))
			.handleEvents(receiveOutput: {
				$0.map(from: item)
			})
			.tryMap { [weak self] _ in
				try self?.cdStack.saveContext()
			}
			.eraseToAnyPublisher()
	}

	func update(_ item: Category) -> AnyPublisher<Void, Error> {
		tryFetch(by: item.name)
			.handleEvents(receiveOutput: {
				$0.map(from: item)
			})
			.tryMap { [weak self] _ in
				try self?.cdStack.saveContext()
			}
			.eraseToAnyPublisher()
	}

	func delete(_ item: Category) -> AnyPublisher<Void, Error> {
		tryFetch(by: item.name)
			.tryMap(cdStack.mainContext.delete(_:))
			.tryMap(cdStack.saveContext)
			.eraseToAnyPublisher()
	}

	private func tryFetch(by name: String) -> AnyPublisher<CategoryMO, Error> {
		Just(fetchRequest)
			.handleEvents(receiveOutput: {
				$0.predicate = NSPredicate(format: "categoryName = %@", name)
			})
			.tryCompactMap { [weak self] in
				try self?.cdStack.mainContext.fetch($0).first
			}
			.eraseToAnyPublisher()
	}
}
