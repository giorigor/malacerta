//
//  TravelsCell.swift
//  MalaCerta
//
//  Created by Student on 11/08/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class TravelsCell: UITableViewCell {
	@IBOutlet weak var localLabel: UILabel!
	@IBOutlet weak var dateLabel: UILabel!
	@IBOutlet weak var bgImageLabel: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
