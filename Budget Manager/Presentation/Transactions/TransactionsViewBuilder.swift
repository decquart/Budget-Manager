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
		let viewModel = TransactionsViewModel()
		let view = TransactionsView(viewModel: viewModel)
		return view
	}
}
