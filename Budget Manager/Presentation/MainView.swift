//
//  MainView.swift
//  Budget Manager
//
//  Created by Volodymyr Myhailyuk on 04.04.2021.
//

import SwiftUI

struct MainView: View {
    var body: some View {
		TabView {
			TransactionsViewBuilder
				.makeTransactionsView()
				.tabItem {
					Label("Transactions", systemImage: "dollarsign.circle")
				}
			WalletsView()
				.tabItem {
					Label("Wallets", systemImage: "wallet.pass")
				}
		}
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
