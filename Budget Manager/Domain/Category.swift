//
//  Category.swift
//  Budget Manager
//
//  Created by Volodymyr Myhailyuk on 27.04.2021.
//

import Foundation

struct Category: Decodable {
	enum CategoryType: Int, Decodable {
		case expenses, income
	}

	let name: String
	let imageName: String
	let type: CategoryType
}
