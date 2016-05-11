//
//  TabBarViewController.swift
//  swift-01
//
//  Created by pengxiuxiu on 16/4/26.
//  Copyright © 2016年 pengxiuxiu. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    var titleArr = ["首页","我的"]
    var imageArr = ["emptyStart.png","搜索框内图标.png"]
    var selectImageArr = ["start.png","搜索.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTab()
    }
    //把16进制的颜色转化成color
    func colorWithHexString (hex:String) -> UIColor {
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substringFromIndex(1)
        }
        
        let rString = (cString as NSString).substringToIndex(2)
        let gString = ((cString as NSString).substringFromIndex(2) as NSString).substringToIndex(2)
        let bString = ((cString as NSString).substringFromIndex(4) as NSString).substringToIndex(2)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        NSScanner(string: rString).scanHexInt(&r)
        NSScanner(string: gString).scanHexInt(&g)
        NSScanner(string: bString).scanHexInt(&b)
        
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
    

    func setTab(){
        self.tabBar.translucent = false
        self.tabBar.barTintColor = colorWithHexString("#ffced7")
        
        UITabBarItem.appearance().setTitleTextAttributes(   [NSForegroundColorAttributeName:UIColor.purpleColor()], forState:.Selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:colorWithHexString("262626")],forState:.Normal)
        
        for i in 0..<self.titleArr.count{
            let tabBarItem = self.tabBar.items![i]
            tabBarItem.title = titleArr[i]
            tabBarItem.image = UIImage(named: imageArr[i])
            tabBarItem.selectedImage = UIImage(named: selectImageArr[i])
           tabBarItem.selectedImage = tabBarItem.selectedImage?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
