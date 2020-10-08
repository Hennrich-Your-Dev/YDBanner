//
//  YDLiveBannerView.swift
//  YDLiveBanner
//
//  Created by Douglas Hennrich on 02/10/20.
//  Copyright © 2020 YourDev. All rights reserved.
//

import UIKit
import Kingfisher
import KingfisherWebP

public class YDLiveBannerView: UIImageView {

	// MARK: Init
	public required init?(coder: NSCoder) {
		super.init(coder: coder)
	}

	public override func layoutSubviews() {
		super.layoutSubviews()
	}

	// MARK: Actions
	public func config(with config: YDLiveBannerConfig) {
		guard let superview = superview else { return }

		kf.setImage(
			with: URL(string: config.image),
			options: [.processor(WebPProcessor.default)],
			completionHandler: { [weak self] result in
				if case .success(let imageSuccess) = result {
					let ratio = imageSuccess.image.size.width / imageSuccess.image.size.height

					if superview.frame.width > superview.frame.height {
						let newHeight = superview.frame.width / ratio
						self?.frame.size = CGSize(width: superview.frame.width, height: newHeight)

					} else{
						let newWidth = superview.frame.height * ratio
						self?.frame.size = CGSize(width: newWidth, height: superview.frame.height)
					}
				}

				self?.changeConstraints()
			}
		)
	}

	func changeConstraints() {
		guard let superview = superview else {
			return
		}

		print(frame)
		NSLayoutConstraint.activate([
			superview.topAnchor.constraint(equalTo: topAnchor),
			superview.heightAnchor.constraint(equalToConstant: self.frame.height)
		])
	}
}

