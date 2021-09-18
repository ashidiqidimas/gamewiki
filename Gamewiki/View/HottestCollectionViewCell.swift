//
//  HottestCollectionViewCell.swift
//  Gamewiki
//
//  Created by Dimas on 17/09/21.
//

import UIKit

class HottestCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var gametitle: UILabel!
	@IBOutlet weak var ratingView: StarsRating!
	
	static let identifier = "HottestCollectionViewCell"
	static let nib = UINib(nibName: "HottestCollectionViewCell", bundle: nil)

    override func awakeFromNib() {
        super.awakeFromNib()
        
		contentView.backgroundColor = .init(named: "ForeGroundColor")
		
		self.layer.cornerRadius = 32
		self.layer.masksToBounds = true
		
		imageView.contentMode = .scaleAspectFill
		
		imageView.image = UIImage(named: "testImage")
		gametitle.text = "Grand Theft Auto V"
		ratingView.update(withRating: 3.7)
    }
	
}
