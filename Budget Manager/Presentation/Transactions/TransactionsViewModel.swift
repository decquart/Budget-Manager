//
//  TransactionsViewModel.swift
//  Budget Manager
//
//  Created by Volodymyr Myhailyuk on 26.04.2021.
//

import Foundation
import Combine

class TransactionsViewModel<CategoriesRepo: Repository> {
	let repo: CategoriesRepo

	init(repo: CategoriesRepo) {
		self.repo = repo
	}
}
