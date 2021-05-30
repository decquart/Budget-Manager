//
//  NeuButtonStyle.swift
//  Budget Manager
//
//  Created by Volodymyr Myhailyuk on 30.05.2021.
//

import SwiftUI

struct NeuButtonStyle: ButtonStyle {
	let width: CGFloat
	let height: CGFloat

	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.frame(width: width, height: height)
			.background(
				Group {
					if configuration.isPressed {
						Capsule()
							.fill(Color.element)
							.shadow(at: .southEast)
					} else {
						Capsule()
							.fill(Color.element)
							.shadow(at: .northWest)
					}
				}
			)
			.opacity(configuration.isPressed ? 0.2 : 1.0)
	}
}
