//
//  ViewController.swift
//  swift-01
//
//  Created by pengxiuxiu on 16/4/26.
//  Copyright © 2016年 pengxiuxiu. All rights reserved.
//

import UIKit
//import Foundation

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,ImageScrollDelegate{

    var imageName = ["image1","image2","image3","image4","image5"]
    var image = ["1","2","3","4","5"]
    var isFlag = [Bool](count: 5, repeatedValue: false)
    var tableView = UITableView()
    var alertView = UIAlertController()
    
    var second = SecondViewController()
    
    var bottomView = NSBundle.mainBundle().loadNibNamed("BottomView", owner: nil, options: nil).first as? BottomView

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "首页";
        self.view.backgroundColor = colorWithHexString("f2f2f2")
        
        self.createTableView()
        self.createBottomView()
        
        /*   自定义cell注册   */
        let cellIndentifier = "mycell";
        tableView.registerNib(UINib(nibName: "ViewCell", bundle: nil), forCellReuseIdentifier:cellIndentifier)
        
        tableView.registerNib(UINib(nibName: "ImageViewCell", bundle: nil), forCellReuseIdentifier: "imagecell")
        
        //接收通知
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: "respondsFromTip:", name:"tipWhich", object: nil)

        
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
        tableView = UITableView(frame:CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height - 100) ,style: UITableViewStyle.Grouped)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
    }
    
    func createBottomView(){
        bottomView?.frame = CGRectMake(0, UIScreen.mainScreen().bounds.size.height - 100, UIScreen.mainScreen().bounds.size.width, 100)
        self.view.addSubview(bottomView!)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3;
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
        if(indexPath.section == 1){
            let identifier = "imagecell"
            let cell:ImageViewCell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)as!ImageViewCell
            cell.backgroundColor = colorWithHexString("f2f2f2")
            cell.delegate = self;
            return cell;
        }
        //自定义cell
        let cell:ViewCell = tableView.dequeueReusableCellWithIdentifier("mycell",forIndexPath: indexPath)as! ViewCell
        cell.backgroundColor = colorWithHexString("f2f2f2")
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.imageInfo.image = UIImage(named: image[indexPath.row])
        cell.freeBtn.addTarget(self, action: Selector("LogAction"), forControlEvents: UIControlEvents.TouchUpInside)
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 1 ? 1 : imageName.count ;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if(indexPath.section == 1){
            return 84;
        }
        if(indexPath.section == 0 ){
            return 50
        }
        return 90
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (indexPath.section == 0){
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
    }
    
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    
    func LogAction(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        second = storyBoard.instantiateViewControllerWithIdentifier("second")as!SecondViewController
            self.navigationController!.pushViewController(second, animated: true)

    }
    
    /*******///通知传值
//    func respondsFromTip(notification:NSNotification){
//        let num = notification.object?.valueForKey("num") as? String
//        self.alerAction(NSInteger(num!)! - 1000)
//    }
    
    /******///代理协议传值
    func responseFromTip(num: NSInteger) {
        self.alerAction(num - 1000)
    }
    
    
    func alerAction(num:NSInteger){
        if(num == 0){
             alertView = UIAlertController(title: "心灵", message: "我们渐行渐远，时间治愈了我们的感情，say bye!", preferredStyle: UIAlertControllerStyle.Alert)
            self.presentViewController(alertView, animated: true, completion: nil)
        }
        if (num == 1){
             alertView = UIAlertController(title: "放弃", message: "频繁回头的人走不了多远，我决定跟你say goodbye!", preferredStyle: UIAlertControllerStyle.Alert)
            self.presentViewController(alertView, animated: true, completion: nil)
        }
        if(num == 2){
            alertView = UIAlertController(title: "你太执着", message: "你选择放弃，我从你，只要你不后悔，我也不会后悔的往前大步跨去!", preferredStyle: UIAlertControllerStyle.Alert)
            self.presentViewController(alertView, animated: true, completion: nil)
        }
        if(num == 3){
            alertView = UIAlertController(title: "我可以活的完美", message: "即使没有你，我也可以活的漂亮!", preferredStyle: UIAlertControllerStyle.Alert)
            self.presentViewController(alertView, animated: true, completion: nil)
        }
        alertView.addAction(UIAlertAction(title: "放弃...", style: UIAlertActionStyle.Default,handler: nil))
    }
    
    func Dismiss(){
         self.presentViewController(alertView, animated: true, completion: nil)
    }
    /*******/
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

