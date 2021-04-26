//
//  CategoryRepository.swift
//  Budget Manager
//
//  Created by Volodymyr Myhailyuk on 27.04.2021.
//

import Foundation
import Combine

final class CategoryRepository: Repository {
	func get(by predicate: NSPredicate) -> AnyPublisher<Category, Error> {
		Fail(error: TestError.err).eraseToAnyPublisher()
	}

	func getAll() -> AnyPublisher<[Category], Error> {
		Fail(error: TestError.err).eraseToAnyPublisher()
	}

	func add(_ item: Category) -> AnyPublisher<Void, Error> {
		Future() { promise in
			promise(Result.success(()))
		}
		.eraseToAnyPublisher()
	}

	func update(_ item: Category) -> AnyPublisher<Void, Error> {
		Future() { promise in
			promise(Result.success(()))
		}
		.eraseToAnyPublisher()
	}

	func delete(_ item: Category) -> AnyPublisher<Void, Error> {
		Future() { promise in
			promise(Result.success(()))
		}
		.eraseToAnyPublisher()
	}

}
