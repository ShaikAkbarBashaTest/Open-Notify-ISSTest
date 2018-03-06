//
//  PassesListViewCellTableViewCell.swift
//  Open-Notify-ISS-Times
//
//  Created by Shaik Akbar Basha on 3/6/18.
//  Copyright © 2018 Akbar. All rights reserved.
//

import UIKit

class PassesListViewCellTableViewCell: UITableViewCell {

    @IBOutlet weak var timeLable: UILabel!
    @IBOutlet weak var durationLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
