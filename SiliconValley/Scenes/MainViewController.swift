//
//  ViewController.swift
//  SiliconValley
//
//  Created by Константин Натаров on 18.07.2024.
//

import UIKit

final class MainScreenViewController: UIViewController {

	// MARK: - Initialization

	init() {
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .blue
		print("Hello")
	}


}

