//
//  YDLiveBannerView.swift
//  YDLiveBanner
//
//  Created by Douglas Hennrich on 02/10/20.
//  Copyright © 2020 YourDev. All rights reserved.
//

import UIKit
import Kingfisher

public class YDLiveBannerView: UIView {

	// MARK: Properties
	var callback: ((_ bannerId: String) -> Void)?
	var tapOnBannerGesture: UIGestureRecognizer?
	var bannerId: String?

	// MARK: IBOutlets
	@IBOutlet var contentView: UIView!

	@IBOutlet weak var bannerImage: UIImageView!

	// MARK: Init
	public required init?(coder: NSCoder) {
		super.init(coder: coder)
		instanceFromNib()
	}

	func prepareToInstance() {
		callback = nil

		if let gesture = tapOnBannerGesture {
			bannerImage?.removeGestureRecognizer(gesture)
			tapOnBannerGesture = nil
		}
	}

	// MARK: Private
	private func instanceFromNib() {
		contentView = loadNib()
		addSubview(contentView)
	}

	// MARK: Actions
	public func config(with config: YDLiveBannerConfig, onBannerTap: @escaping ((_ bannerId: String) -> Void)) {
		prepareToInstance()

		bannerImage.kf.setImage(with: URL(string: config.image))

		callback = onBannerTap

		bannerId = config.bannerId

		tapOnBannerGesture = UITapGestureRecognizer(
			target: self,
			action: #selector(onBannerTapAction)
		)

		if let gesture = tapOnBannerGesture {
			bannerImage.addGestureRecognizer(gesture)
		}
	}

	@objc func onBannerTapAction() {
		guard let bannerId = bannerId else {
			return
		}

		callback?(bannerId)
	}
}
