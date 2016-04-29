//
//  SecondTableViewCell.swift
//  swift-01
//
//  Created by pengxiuxiu on 16/4/27.
//  Copyright © 2016年 pengxiuxiu. All rights reserved.
//

import UIKit

class SecondTableViewCell: UITableViewCell {
    
    @IBOutlet weak var view: UIImageView!
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
