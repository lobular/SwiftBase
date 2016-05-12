//
//  ImageViewCell.swift
//  SwiftBase
//
//  Created by pengxiuxiu on 16/5/11.
//  Copyright © 2016年 pengxiuxiu. All rights reserved.
//

import UIKit

//协议
protocol ImageScrollDelegate{
    func responseFromTip(num:NSInteger)
}

class ImageViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imageScroll: UIScrollView!
    
    var delegate:ImageScrollDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageScroll.frame = self.bounds
        imageScroll.pagingEnabled = false
        imageScroll.scrollEnabled = true
        imageScroll.showsHorizontalScrollIndicator = false
        imageScroll.showsVerticalScrollIndicator = false
        imageScroll.contentSize = CGSizeMake((84 + 10) * 9 , 84)
        self.createImage()
        
    }
    
    func createImage(){
       var image = ["1","2","3","4","5","6","7","8","9"]
        var imageName = ["我","们","渐","行","渐","远","不","回","头"]
        for  i in 0..<9{
            let imageView = UIImageView(frame: CGRectMake(CGFloat(i) * (84 + 10), 0, 84, 84))
            let label = UILabel(frame: CGRectMake(CGFloat(i) * (84 + 10), imageView.frame.height - 20 , 84, 20))
            label.backgroundColor = UIColor(red: 255 / 255.0, green: 193 / 255.0, blue: 205 / 255.0, alpha: 0.5)
            label.text = imageName[i]
            label.textColor = UIColor.purpleColor()
            label.textAlignment = NSTextAlignment.Center
            imageView.tag = 1000 + i
            let tapGesture = UITapGestureRecognizer(target: self, action: "tapAction:")
            imageView.userInteractionEnabled = true
            imageView.addGestureRecognizer(tapGesture)
            imageView.image = UIImage(named: image[i])
            
           imageScroll.addSubview(imageView)
           imageScroll.addSubview(label)
        }
        
    }
    
    func tapAction(send:UITapGestureRecognizer){
        self.delegate!.responseFromTip(send.view!.tag)
//        let dic = ["num": String(send.view!.tag)]
//        NSNotificationCenter.defaultCenter().postNotificationName("tipWhich", object: dic)

    }

    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
