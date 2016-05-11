//
//  ViewController.swift
//  swift-01
//
//  Created by pengxiuxiu on 16/4/26.
//  Copyright © 2016年 pengxiuxiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var imageName = ["image1","image2","image3","image4","image5"]
    var image = ["image1.jpg","image2.jpg","image3.jpg","image4.jpg","image5.jpg"]
    var isFlag = [Bool](count: 5, repeatedValue: false)
    var tableView = UITableView()
    
    var bottomView = NSBundle.mainBundle().loadNibNamed("BottomView", owner: nil, options: nil).first as? BottomView

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor .orangeColor();
        
        self.navigationItem.title = "首页";
        
        self.createTableView()
        self.createBottomView()
        
        /*   自定义cell注册   */
        let cellIndentifier = "mycell";
        tableView.registerNib(UINib(nibName: "ViewCell", bundle: nil), forCellReuseIdentifier:cellIndentifier)
        
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
    
    
    func createTableView(){
        tableView = UITableView(frame: UIScreen.mainScreen().bounds,style: UITableViewStyle.Grouped)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
    
    func createBottomView(){
        bottomView?.frame = CGRectMake(0, UIScreen.mainScreen().bounds.size.height - 100, UIScreen.mainScreen().bounds.size.width, 100)
        self.view.addSubview(bottomView!)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if(indexPath.section == 0){
            let initIdentifier = "cell"
            let cell = UITableViewCell(style:UITableViewCellStyle.Subtitle,reuseIdentifier: initIdentifier)
            cell.selectionStyle = UITableViewCellSelectionStyle.None
            cell.textLabel?.text = imageName[indexPath.row]
            cell.detailTextLabel?.text = "imageName\(indexPath.row + 1)"
            cell.imageView?.image = UIImage(named:image[indexPath.row])
            cell.accessoryType = UITableViewCellAccessoryType.DetailButton
            if isFlag[indexPath.row]{
                cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            }else{
                cell.accessoryType = UITableViewCellAccessoryType.None
            }
            return cell
        }
        //自定义cell
        let cell:ViewCell = tableView.dequeueReusableCellWithIdentifier("mycell",forIndexPath: indexPath)as! ViewCell
        cell.backgroundColor = colorWithHexString("f2f2f2")
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? imageName.count : 2;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return indexPath.section == 0 ? 50 :90
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //使用闭包，和嵌套函数或者JAVA中的匿名类类似
        let locationActionHandler = {(action: UIAlertAction!) -> Void in
            let locationAlertController = UIAlertController(title: nil, message: "我是搞笑\(indexPath.row + 1)", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            
            locationAlertController.addAction(okAction)
            self.presentViewController(locationAlertController, animated: true, completion: nil)
            
        }
        let alertController = UIAlertController(title: "搞笑图\(indexPath.row + 1)", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        let cancleAction = UIAlertAction(title: "Cancle", style: UIAlertActionStyle.Cancel, handler: nil)
        alertController.addAction(cancleAction)
        
        let locationAction = UIAlertAction(title: "选我喽", style: UIAlertActionStyle.Default, handler: locationActionHandler)
        alertController.addAction(locationAction)
        
        let markAction = UIAlertAction(title: "标记我一下嘛", style: UIAlertActionStyle.Default, handler: {(action: UIAlertAction) -> Void in
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            //此时可以将图片标记为勾，但是当往下拖动图片之前被标记的勾消失，是因为每次只加载出现在屏幕上的，其它都放在缓存池
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
            self.isFlag[indexPath.row] = true//然后每次加载时候在cellForRowAtIndexPath方法进行判断
        })
        alertController.addAction(markAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

