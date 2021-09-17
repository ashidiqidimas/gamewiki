//
//  ResultCell.swift
//  Gamewiki
//
//  Created by Dimas on 17/09/21.
//

import UIKit

class ResultCell: UITableViewCell {

	static let nib = "ResultCell"
	static let identifier = "ResultCell"
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		contentView.backgroundColor = .init(named: "BackGroundColor")
	}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
