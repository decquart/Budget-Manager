//
//  CoreDataStack.swift
//  Budget Manager
//
//  Created by Volodymyr Myhailyuk on 25.04.2021.
//

import CoreData

final class CoreDataStack {
	static let shared = CoreDataStack(name: "Budget_Manager")
	private let name: String

	private init(name: String) {
		self.name = name
	}

	private lazy var persistentContainer: NSPersistentContainer = {
		let container = NSPersistentContainer(name: name)

		container.loadPersistentStores { _, error in
			if let error = error as NSError? {
				print("Unresolved error \(error.localizedDescription), \(error.userInfo)")
			}
		}
		return container
	}()

	lazy var mainContext: NSManagedObjectContext = {
		return self.persistentContainer.viewContext
	}()

	func saveContext() {
		if !mainContext.hasChanges {
			return
		}

		do {
			try mainContext.save()
		} catch let error as NSError {
			print("Unresolved error \(error.localizedDescription), \(error.userInfo)")
		}
	}
}
