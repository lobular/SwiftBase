//
//  ImageViewCell.swift
//  SwiftBase
//
//  Created by pengxiuxiu on 16/5/11.
//  Copyright © 2016年 pengxiuxiu. All rights reserved.
//

import UIKit

class ImageViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imageScroll: UIScrollView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageScroll.frame = self.bounds
        imageScroll.pagingEnabled = true
        imageScroll.scrollEnabled = true
        imageScroll.showsHorizontalScrollIndicator = false
        imageScroll.showsVerticalScrollIndicator = false
        imageScroll.contentSize = CGSizeMake(84 * 5 + 40, 84)
        self.createImage()
        
    }
    
    func createImage(){
       var image = ["image1.jpg","image2.jpg","image3.jpg","image4.jpg","image5.jpg"]
        var imageName = ["我","不","吭","不","代","表","我","没","脾","气"]
        for  i in 0..<5{
            let imageView = UIImageView(frame: CGRectMake(CGFloat(i) * (84 + 10), 0, 84, 84))
            let label = UILabel(frame: CGRectMake(CGFloat(i) * (84 + 10), imageView.frame.height - 20 , 84, 20))
            label.backgroundColor = UIColor(red: 255 / 255.0, green: 193 / 255.0, blue: 205 / 255.0, alpha: 0.8)
            label.text = imageName[i]
            label.textColor = UIColor.blackColor()
            imageView.image = UIImage(named: image[i])
            
           imageScroll.addSubview(imageView)
           imageScroll.addSubview(label)
        }
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
