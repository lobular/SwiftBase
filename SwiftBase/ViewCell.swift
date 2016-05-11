//
//  ViewCell.swift
//  SwiftBase
//
//  Created by pengxiuxiu on 16/5/10.
//  Copyright © 2016年 pengxiuxiu. All rights reserved.
//

import UIKit

class ViewCell: UITableViewCell {

    @IBOutlet weak var freeBtn: UIButton!
    
    @IBOutlet weak var imageInfo: UIImageView!
    
    
    override func drawRect(rect: CGRect) {
        freeBtn.layer.cornerRadius = 15
        freeBtn.layer.borderColor = UIColor(red: 34 / 255.0, green: 226 / 255.0, blue: 165 / 255.0, alpha: 1.0).CGColor
        freeBtn.layer.borderWidth = 1
        freeBtn.layer.shadowColor = UIColor(red: 34 / 255.0, green: 226 / 255.0, blue: 165 / 255.0, alpha: 1.0).CGColor
        freeBtn.layer.shadowOpacity = 0.5 //阴影透明度
        freeBtn.layer.shadowOffset = CGSize(width: 2, height: 0) //阴影偏移量
        freeBtn.layer.masksToBounds = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
