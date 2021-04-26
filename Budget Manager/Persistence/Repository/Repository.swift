//
//  Repository.swift
//  Budget Manager
//
//  Created by Volodymyr Myhailyuk on 26.04.2021.
//

import Foundation
import Combine

enum TestError: Error {
	case err
}

protocol Repository {
	associatedtype Item

	func get(by predicate: NSPredicate) -> AnyPublisher<Item, Error>
	func getAll() -> AnyPublisher<[Item], Error>
	func add(_ item: Item) -> AnyPublisher<Void, Error>
	func update(_ item: Item) -> AnyPublisher<Void, Error>
	func delete(_ item: Item) -> AnyPublisher<Void, Error>
}
