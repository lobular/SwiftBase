//
//  SecondViewController.swift
//  swift-01
//
//  Created by pengxiuxiu on 16/4/26.
//  Copyright © 2016年 pengxiuxiu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    let cellIdentifier = "cell"
     var tableView = UITableView()
    var thirdView = ThirdViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "我的"
        
        tableView = UITableView(frame: UIScreen .mainScreen().bounds,style: UITableViewStyle.Grouped)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        tableView.registerNib(UINib(nibName: "SecondTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:SecondTableViewCell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)as! SecondTableViewCell
        cell.view?.image = UIImage(named: "image1")
        cell.name.text = "我喜欢"
//        let tapGesture = UITapGestureRecognizer(target: self, action: "tapAction:")
//        cell.name.addGestureRecognizer(tapGesture)
//        cell.name.userInteractionEnabled = true
        cell.name.tag = indexPath.row
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        ClickAction(indexPath.row);
    }
    
    func ClickAction(num:Int){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        thirdView = storyBoard.instantiateViewControllerWithIdentifier("third")as!ThirdViewController
        self.hidesBottomBarWhenPushed = true
        self.navigationController!.pushViewController(thirdView, animated: true)
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
