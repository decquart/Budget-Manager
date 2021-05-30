//
//  TransactionsViewBuilder.swift
//  Budget Manager
//
//  Created by Volodymyr Myhailyuk on 26.04.2021.
//

import Foundation
import SwiftUI

enum TransactionsViewBuilder {
	static func makeTransactionsView() -> some View {
		let categoryRepository = CategoryRepository()
		let transactionsRepository = TransactionRepository()
		let viewModel = TransactionsViewModel<CategoryRepository, TransactionRepository>(categoryRepo: categoryRepository, transactionsRepo: transactionsRepository)
		let view = TransactionsView(viewModel: viewModel)
		return view
	}
}
