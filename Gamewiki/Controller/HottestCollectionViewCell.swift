//
//  HottestCollectionViewCell.swift
//  Gamewiki
//
//  Created by Dimas on 12/09/21.
//

import UIKit

class HottestCollectionViewCell: UICollectionViewCell {
	
    static let identifier = "HottestCollectionViewCell"
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setup()
	}
	
	func setup() {
		contentView.backgroundColor = .white
		self.layer.cornerRadius = 32
		self.layer.masksToBounds = true
	}
}
