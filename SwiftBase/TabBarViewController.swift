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

    func setTab(){
        self.tabBar.translucent = false
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
