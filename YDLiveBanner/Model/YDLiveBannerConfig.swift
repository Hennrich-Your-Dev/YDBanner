//
//  YDLiveBannerConfig.swift
//  YDLiveBanner
//
//  Created by Douglas Hennrich on 02/10/20.
//  Copyright © 2020 YourDev. All rights reserved.
//

import Foundation

public class YDLiveBannerConfig {

	let image: String
	let bannerId: String

	// MARK: Init
	public init(image: String, bannerId: String) {
		self.image = image
		self.bannerId = bannerId
	}
}
