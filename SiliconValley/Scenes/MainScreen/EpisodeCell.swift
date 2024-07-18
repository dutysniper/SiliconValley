//
//  EpisodeCell.swift
//  SiliconValley
//
//  Created by Константин Натаров on 18.07.2024.
//

import UIKit

final class EpisodeCell: UICollectionViewCell {

	static let identifier = "EpisodeCell"

	private lazy var imageView: UIImageView = makeImageView()
	private lazy var label: UILabel = makeLabel()

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
		setupUI()
		layout()
	}

	func configure(with episode: Episode) {
		imageView.image = UIImage(named: episode.image)
		label.text = episode.title
	}
}

// MARK: - SetupUI

private extension EpisodeCell {

	func setupUI() {
		contentView.addSubview(imageView)
		contentView.addSubview(label)
	}

	func makeImageView() -> UIImageView {
		let imageView = UIImageView()

		imageView.contentMode = .scaleAspectFit

		imageView.translatesAutoresizingMaskIntoConstraints = false

		return imageView
	}

	func makeLabel() -> UILabel {
		let label = UILabel()

		label.textAlignment = .center

		label.translatesAutoresizingMaskIntoConstraints = false

		return label
	}
}

// MARK: - Layout

private extension EpisodeCell {

	func layout() {
		NSLayoutConstraint.activate(
			[
				imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
				imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
				imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
				imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.75),

				label.topAnchor.constraint(equalTo: imageView.bottomAnchor),
				label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
				label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
				label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
			]
		)
	}
}

// MARK: - Focus Environment

extension EpisodeCell {
	override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
		super.didUpdateFocus(in: context, with: coordinator)

		if isFocused {
			contentView.backgroundColor = .gray
		} else {
			contentView.backgroundColor = .clear
		}
	}
}
