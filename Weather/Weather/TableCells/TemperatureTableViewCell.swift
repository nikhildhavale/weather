//
//  TemperatureTableViewCell.swift
//  Weather
//
//  Created by Nikhil Modi on 10/12/18.
//  Copyright © 2018 Nikhil Dhavale. All rights reserved.
//

import UIKit

class TemperatureTableViewCell: UITableViewCell {

    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
