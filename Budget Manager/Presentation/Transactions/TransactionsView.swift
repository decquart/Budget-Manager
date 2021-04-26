//
//  TransactionsView.swift
//  Budget Manager
//
//  Created by Volodymyr Myhailyuk on 04.04.2021.
//

import SwiftUI

struct TransactionsView: View {
	let viewModel: TransactionsViewModel

    var body: some View {
		Button("Add new") {
			print("added")
		}
    }
}

struct TransactionsView_Previews: PreviewProvider {
    static var previews: some View {
		TransactionsViewBuilder.makeTransactionsView()
    }
}
