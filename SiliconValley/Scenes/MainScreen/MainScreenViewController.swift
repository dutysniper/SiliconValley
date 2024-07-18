//
//  ViewController.swift
//  SiliconValley
//
//  Created by Константин Натаров on 18.07.2024.
//

import UIKit

final class MainScreenViewController: UIViewController {

	// MARK: - Public properties
	// MARK: - Dependencies
	// MARK: - Private properties

	private lazy var collectionViewEpisodes: UICollectionView = makeCollectionView()
	private lazy var imageViewSelected: UIImageView = makeImageView()
	private let episodes = [
		Episode(title: "1 episode", image: "1 episode"),
		Episode(title: "2 episode", image: "2 episode"),
		Episode(title: "3 episode", image: "3 episode"),
		Episode(title: "4 episode", image: "4 episode"),
		Episode(title: "5 episode", image: "5 episode"),
		Episode(title: "6 episode", image: "6 episode")
	]

	// MARK: - Initialization

	init() {
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
		print("Hello")
		setupUI()
	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		layout()
	}
	// MARK: - Public methods
	// MARK: - Private methods
}
	// MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout

	extension MainScreenViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
		func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
			episodes.count
		}

		func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

			let cell = collectionView.dequeueReusableCell(
				withReuseIdentifier: EpisodeCell.identifier,
				for: indexPath
			) as! EpisodeCell

			let episode = episodes[indexPath.item]
			cell.configure(with: episode)

			return cell
		}

		func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
			CGSize(width: view.frame.width / 4, height: collectionView.frame.height)
		}

		func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
			let episode = episodes[indexPath.item]
			imageViewSelected.image = UIImage(named: episode.image)
		}
	}

// MARK: - SetupUI

private extension MainScreenViewController {

	func setupUI() {
		view.addSubview(collectionViewEpisodes)
		view.addSubview(imageViewSelected)
	}

	func makeCollectionView() -> UICollectionView {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal

		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

		collectionView.translatesAutoresizingMaskIntoConstraints = false

		collectionView.backgroundColor = .clear
		collectionView.dataSource = self
		collectionView.delegate = self
		collectionView.register(EpisodeCell.self, forCellWithReuseIdentifier: EpisodeCell.identifier)

		return collectionView
	}

	func makeImageView() -> UIImageView {
		let imageView = UIImageView()

		imageView.contentMode = .scaleAspectFit

		imageView.translatesAutoresizingMaskIntoConstraints = false

		return imageView
	}
}

// MARK: - Layout

private extension MainScreenViewController {

	func layout() {
		NSLayoutConstraint.activate(
			[
				collectionViewEpisodes.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
				collectionViewEpisodes.leadingAnchor.constraint(equalTo: view.leadingAnchor),
				collectionViewEpisodes.trailingAnchor.constraint(equalTo: view.trailingAnchor),
				collectionViewEpisodes.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),

				imageViewSelected.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
				imageViewSelected.leadingAnchor.constraint(equalTo: view.leadingAnchor),
				imageViewSelected.trailingAnchor.constraint(equalTo: view.trailingAnchor),
				imageViewSelected.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
			]
		)
	}
}

// MARK: - Focus Environment

extension MainScreenViewController {

	override var preferredFocusEnvironments: [UIFocusEnvironment] {
		[collectionViewEpisodes]
	}

	override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
		if let nextFocusedItem = context.nextFocusedItem as? EpisodeCell,
		   let indexPath = collectionViewEpisodes.indexPath(for: nextFocusedItem) {
			let episode = episodes[indexPath.item]
			imageViewSelected.image = UIImage(named: episode.image)
		}
	}
}

