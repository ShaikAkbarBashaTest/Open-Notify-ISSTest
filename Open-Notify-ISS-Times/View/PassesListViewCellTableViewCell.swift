/*
 Open-Notify-ISS-Times
 
 File: PassesListViewCellTableViewCell.swift
 
 Version: <1.0>
 
 Copyright © 2018 Akbar. All rights reserved.
 */

import UIKit

class PassesListViewCellTableViewCell: UITableViewCell {
    //Lable to display Time data
    @IBOutlet weak var timeLable: UILabel!
    //Lable to display Duration in seconds
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
