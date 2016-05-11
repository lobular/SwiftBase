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
        for  i in 0..<5{
            let imageView = UIImageView(frame: CGRectMake( CGFloat(i) * (84 + 10), 0, 84, 84))
            imageView.image = UIImage(named: image[i])
           imageScroll.addSubview(imageView)
        }
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
