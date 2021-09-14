//
//  ViewController.swift
//  Gamewiki
//
//  Created by Dimas on 08/09/21.
//  a4178d248c7b4502910ec5be5d65ddad

import UIKit

class ViewController: UIViewController {
	
	let resultsTableView = UITableView()
	
	@IBOutlet weak var searchMovies: UISearchBar!
	
	override func viewDidLoad() {
		
		customizeUI()
		configureNavBar()
		
		searchMovies.delegate = self
		resultsTableView.dataSource = self
		resultsTableView.delegate = self
		
		resultsTableView.translatesAutoresizingMaskIntoConstraints = false
		resultsTableView.register(UINib(nibName: ResultCell.nib, bundle: nil), forCellReuseIdentifier: ResultCell.identifier)
		resultsTableView.keyboardDismissMode = .onDrag
		view.addSubview(resultsTableView)
		
		NSLayoutConstraint.activate([
			resultsTableView.topAnchor.constraint(equalTo: searchMovies.bottomAnchor),
			resultsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			resultsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			resultsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
		
		resultsTableView.isHidden = true
	}

	@IBAction func screenTapped(_ sender: Any) {
		searchMovies.endEditing(true)
		resultsTableView.isHidden = true
		print("tapped")
	}
	
	func customizeUI() {
		view.backgroundColor = .init(named: "BackGroundColor")
		
		// Search bar
		searchMovies.searchTextField.layer.cornerRadius = 19
		searchMovies.searchTextField.layer.masksToBounds = true
		searchMovies.searchTextField.layer.borderWidth = 1
		searchMovies.searchTextField.layer.borderColor = #colorLiteral(red: 0.462745098, green: 0.462745098, blue: 0.5019607843, alpha: 0.6)
		
		searchMovies.barTintColor = .init(named: "BackGroundColor")
		searchMovies.searchTextField.backgroundColor = .clear
	
		let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(white: 1, alpha: 0.55)]
		UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes(attributes,
																										  for: .normal)
		
		// Table view for showing search's results
		resultsTableView.backgroundColor = .clear
		resultsTableView.separatorInset = .init(top: 0, left: 32, bottom: 0, right: 32)
	}
	
	func configureNavBar() {
		self.navigationController?.navigationBar.barTintColor = .black
		let appearance = UINavigationBarAppearance()
		appearance.configureWithTransparentBackground()
		appearance.backgroundImage = UIImage()
		appearance.backgroundColor = .clear
		navigationController?.navigationBar.standardAppearance = appearance
		
		let titleLabel = UILabel()
		titleLabel.font = .init(name: "PressStart2P-Regular", size: 24)
		titleLabel.text = "gamewiki"
		
		guard let titleImage = UIImage(named: "navBarLogo") else { fatalError() }
		
		let titleImageView = UIImageView(image: titleImage)
		NSLayoutConstraint.activate([
			titleImageView.heightAnchor.constraint(equalToConstant: 23),
			titleImageView.widthAnchor.constraint(equalToConstant: 32)
		])
		
		let titleView = UIStackView(arrangedSubviews: [titleLabel, titleImageView])
		titleView.alignment = .bottom
		titleView.spacing = 8
		
		navigationItem.titleView = titleView
	}
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 10
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: ResultCell.identifier, for: indexPath)
		cell.textLabel?.text = "blabla"
		
		return cell
	}
	
}

extension ViewController: UISearchBarDelegate {
	func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
		resultsTableView.isHidden = false
		searchBar.showsCancelButton = true
	}
	
	func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
		// cancel button becomes disabled when search bar isn't first responder, force it back enabled
		DispatchQueue.main.async {
			if let cancelButton = searchBar.value(forKey: "cancelButton") as? UIButton {
				cancelButton.isEnabled = true
			}
		}
		return true
	}

	func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
		searchBar.endEditing(true)
		resultsTableView.isHidden = true
		searchBar.searchTextField.text = ""
	}
	
}
