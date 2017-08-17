//
//  TimelineCell.swift
//  MalaCerta
//
//  Created by Student on 11/08/17.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class TimelineCell: UITableViewCell {

    @IBOutlet weak var horaLabel: UILabel!
    @IBOutlet weak var atividadeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
