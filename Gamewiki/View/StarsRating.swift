//
//  StarsRating.swift
//  Gamewiki
//
//  Created by Dimas on 17/09/21.
//

import UIKit

@IBDesignable
class StarsRating: UIView {
	
	var rating: Float!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setup()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setup()
	}
	
	func setup() {
		backgroundColor = .clear
	}
	
	func update(withRating: Float) {
		rating = withRating
		let starHeight = frame.height
		let starWidth  = frame.width/5
		let starSize = CGSize(width: starHeight, height: starWidth)
		
		for column in 0...4 {
			let starImage = UIImage(systemName: "star.fill")
			let imageView = UIImageView(image: starImage)

			imageView.tintColor = #colorLiteral(red: 1, green: 0.8392156863, blue: 0.03921568627, alpha: 1)
			imageView.frame = .init(origin: CGPoint(x: CGFloat(column) * starWidth, y: 0), size: starSize)
			imageView.contentMode = .scaleAspectFill
			addSubview(imageView)
			
			if rating > 1 {
				rating -= 1
			} else if rating > 0 {
				let starLayer = UIImageView(image: UIImage(systemName: "star"))
				starLayer.tintColor = .init(white: 1, alpha: 0.5)
				starLayer.contentMode = .scaleAspectFill
				starLayer.frame = imageView.frame
				addSubview(starLayer)

				let colorLayer = CALayer()
				colorLayer.backgroundColor = #colorLiteral(red: 1, green: 0.8392156863, blue: 0.03921568627, alpha: 1)
				colorLayer.frame = .init(origin: imageView.bounds.origin,
										 size: .init(width: CGFloat(rating / 1) * imageView.frame.width, height: 17))
				imageView.layer.mask = colorLayer
	
				rating -= 1
			} else {
				imageView.image = UIImage(systemName: "star")
				imageView.tintColor = .init(white: 1, alpha: 0.5)
			}
		}
		
	}
}
