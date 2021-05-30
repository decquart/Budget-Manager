//
//  View+Shadow.swift
//  Budget Manager
//
//  Created by Volodymyr Myhailyuk on 30.05.2021.
//

import SwiftUI

enum ShadowPosition {
	case northWest
	case southEast
}

extension View {
	func shadow(
		at position: ShadowPosition,
		radius: CGFloat = 16,
		offset: CGFloat = 6
	) -> some View {
		return self
			.shadow(
				color: position == .northWest ? .highlight : .shadow,
				radius: radius,
				x: -offset,
				y: -offset
			).shadow(
				color: position == .southEast ? .highlight : .shadow,
				radius: radius,
				x: offset,
				y: offset
			)
	}
}
