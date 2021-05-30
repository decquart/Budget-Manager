//
//  TransactionsView.swift
//  Budget Manager
//
//  Created by Volodymyr Myhailyuk on 04.04.2021.
//

import SwiftUI

struct TransactionsView: View {
	@ObservedObject var viewModel: TransactionsViewModel<CategoryRepository, TransactionRepository>

    var body: some View {
		VStack {
			Spacer()
			Button("Add new") {
				let transaction = Transaction(
					id: UUID.init(),
					amount: 10.0,
					createdAt: Date(),
					photoData: nil
				)

				viewModel.add(transaction: transaction)
				print("added")
			}
			.buttonStyle(NeuButtonStyle(width: 320, height: 48))
			.padding()

		}
    }
}

struct TransactionsView_Previews: PreviewProvider {
    static var previews: some View {
		TransactionsViewBuilder.makeTransactionsView()
    }
}
