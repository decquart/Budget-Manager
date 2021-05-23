//
//  AppDelegate.swift
//  Budget Manager
//
//  Created by Volodymyr Myhailyuk on 02.04.2021.
//

import UIKit
import Combine

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


	private var bag = Set<AnyCancellable>()

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

		seedInitialDataIfNeeded()
		return true
	}
}

private extension AppDelegate {
	func seedInitialDataIfNeeded() {
		let repository = CategoryRepository()
		self.checkItemsExist(inside: repository)
			.flatMap { [unowned self] in
				self.retrieveInitialCategories(from: repository)
			}
			.flatMap { categories -> AnyPublisher<[Void], Error> in
				Publishers
					.MergeMany(categories.map { repository.add($0) })
					.collect()
					.eraseToAnyPublisher()
			}
			.sink(receiveCompletion: {
				print("Completed \($0)")
			}, receiveValue: {
				print("Received \($0)")
			})
			.store(in: &bag)
	}

	func checkItemsExist(inside repository: CategoryRepository) -> AnyPublisher<Void, Error> {
		repository.getAll()
			.tryMap {
				if $0.count > 0 {
					throw "Already added"
				}
			}
			.eraseToAnyPublisher()
	}

	func retrieveInitialCategories(from repository: CategoryRepository) -> AnyPublisher<[Category], Error> {
		Bundle.main.url(forResource: "Categories", withExtension: "plist")
			.publisher
			.tryMap { try Data(contentsOf: $0) }
			.decode(type: [Category].self, decoder: PropertyListDecoder())
			.eraseToAnyPublisher()

	}
}

// todo: move out
extension String: Error {}
