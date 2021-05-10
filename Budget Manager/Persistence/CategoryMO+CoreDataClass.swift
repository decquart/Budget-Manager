//
//  CategoryMO+CoreDataClass.swift
//  Budget Manager
//
//  Created by Volodymyr Myhailyuk on 25.04.2021.
//
//

import Foundation
import CoreData

@objc(CategoryMO)
public class CategoryMO: NSManagedObject {

}

extension CategoryMO {
	var toModel: Category {
		Category(
			name: categoryName,
			imageName: imageName
		)
	}

	func map(from model: Category) {
		self.categoryName = model.name
		self.imageName = model.imageName
	}
}
