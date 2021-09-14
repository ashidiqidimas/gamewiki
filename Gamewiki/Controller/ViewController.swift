//
//  ViewController.swift
//  Gamewiki
//
//  Created by Dimas on 08/09/21.
//  a4178d248c7b4502910ec5be5d65ddad

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
	
	fileprivate let searchBar: UISearchBar = {
		let sb = UISearchBar()
		sb.translatesAutoresizingMaskIntoConstraints = false
		sb.barTintColor = .init(red: 0.082, green: 0.082, blue: 0.082, alpha: 1)
		sb.searchTextField.backgroundColor = .clear
		sb.searchTextField.layer.cornerRadius = 19
		sb.searchTextField.layer.masksToBounds = true
		sb.searchTextField.layer.borderWidth = 1
		sb.searchTextField.layer.borderColor = .init(red: 0.462, green: 0.462, blue: 0.462, alpha: 0.6)
		sb.placeholder = "Search games"
		
		return sb
	}()
	
	fileprivate let collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.sectionInset = UIEdgeInsets(top: 0, left: 32, bottom: 0, right: 20)
		layout.minimumLineSpacing = 16
		layout.scrollDirection = .horizontal
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
		cv.translatesAutoresizingMaskIntoConstraints = false
		cv.register(HottestCollectionViewCell.self, forCellWithReuseIdentifier: HottestCollectionViewCell.identifier)
		
		return cv
	}()
	
	fileprivate let discoverLabel: UILabel = {
		let label = UILabel()
		label.text = "Discover by Genre"
		label.font = .systemFont(ofSize: 28, weight: .bold)
		label.translatesAutoresizingMaskIntoConstraints = false
		
		return label
	}()
	
	fileprivate let hottestLabel: UILabel = {
		let attachment = NSTextAttachment()
		let imgConfig = UIImage.SymbolConfiguration(pointSize: 28, weight: .bold)
		attachment.image = UIImage(systemName: "flame.fill", withConfiguration: imgConfig)?.withTintColor(.systemOrange)
		
		let imageString = NSMutableAttributedString(attachment: attachment)
		let textString = NSAttributedString(string: "Hottest")
		imageString.append(textString)
		
		let label = UILabel()
		label.attributedText = imageString
		label.sizeToFit()
		
		return label
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configureNavBar()
		
		test()
		configureUI()
		
		collectionView.dataSource = self
		collectionView.delegate = self
	}
	
	func configureUI() {
		view.backgroundColor = .init(red: 0.082, green: 0.082, blue: 0.082, alpha: 1)
		
		view.addSubview(searchBar)
		view.addSubview(collectionView)
		view.addSubview(discoverLabel)
		
//		let hottestLabel = UILabel()
//		hottestLabel.text = "Hottest"
//		hottestLabel.font = .systemFont(ofSize: 28, weight: .bold)
//		hottestLabel.translatesAutoresizingMaskIntoConstraints = false
//		let imgConfig = UIImage.SymbolConfiguration(textStyle: .title1)
//		let hottestImage = UIImage(systemName: "flame.fill",
//								   withConfiguration: imgConfig)?
//			.withTintColor(.orange, renderingMode: .alwaysOriginal)
//		let hottestImageView = UIImageView(image: hottestImage)
//		hottestImageView.translatesAutoresizingMaskIntoConstraints = false
//
//		let hottestStack = UIStackView(arrangedSubviews: [hottestLabel, hottestImageView])
//		hottestStack.spacing = 8
//		hottestStack.translatesAutoresizingMaskIntoConstraints = false
//		view.addSubview(hottestStack)
		
		NSLayoutConstraint.activate([
			searchBar.heightAnchor.constraint(equalToConstant: 40),
			searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
			searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
			searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
			
			hottestImageView.heightAnchor.constraint(equalToConstant: 34),
			hottestLabel.widthAnchor.constraint(equalToConstant: 26),
			
			hottestStack.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 16),
			hottestLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
			
			collectionView.topAnchor.constraint(equalTo: hottestStack.bottomAnchor, constant: 8),
			collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			collectionView.heightAnchor.constraint(equalToConstant: 254),
			
			discoverLabel.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 24),
			discoverLabel.leadingAnchor.constraint(equalTo:
													view.safeAreaLayoutGuide.leadingAnchor, constant: 32)
		])
	}
	
	func configureNavBar() {
		self.navigationController?.navigationBar.barTintColor = .black

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

	// TODO
//	func scrollViewDidScroll(_ scrollView: UIScrollView) {
//		let height = scrollView.frame.size.height
//		let contentYoffset = scrollView.contentOffset.y
//		let distanceFromBottom = scrollView.contentSize.height - contentYoffset
//		if distanceFromBottom < height {
//			print(" you reached end of the table")
//		}
//	}
	
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: Int(collectionView.frame.width) - 64, height: 254)
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 10
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(
			withReuseIdentifier: HottestCollectionViewCell.identifier, for: indexPath)
		cell.backgroundColor = .blue
		return cell
	}
	
}



extension ViewController {
	func test() {
		var url = URLComponents(string: "https://api.rawg.io/api/platforms")!
		
		url.queryItems = [
			URLQueryItem(name: "key", value: "a4178d248c7b4502910ec5be5d65ddad")
		]
		
		//		print(url)
	}
	
	@objc func detail() {
		if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController")
			as? DetailViewController {
			navigationController?.pushViewController(vc, animated: true)
		}
	}
}
