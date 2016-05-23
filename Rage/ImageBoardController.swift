//
//  ImageBoardController.swift
//  Rage
//
//  Created by Comp01 on 6/5/16.
//  Copyright © 2016年 Razeware LLC. All rights reserved.
//
import UIKit
import Foundation
class ImageBoardController:UIViewController{
  @IBOutlet weak var labelImageView: UIImageView!
  @IBOutlet weak var tipsLabel: CBAutoScrollLabel!
  @IBOutlet weak var btnList: UIButton!
  var touchPoint:CGPoint!
  var touchTime:CFTimeInterval!
  var _touchPressed:Bool!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Rage"
    
    //refreshControl = UIRefreshControl()
    //refreshControl?.addTarget(self, action: #selector(MasterViewController.reload), forControlEvents: .ValueChanged)
    
    let restoreButton = UIBarButtonItem(title: "Restore", style: .Plain, target: self, action: #selector(MasterViewController.restoreTapped(_:)))
    navigationItem.rightBarButtonItem = restoreButton
    
    //NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MasterViewController.handlePurchaseNotification(_:)),
    
    //label = CB
    //let img = UIImageView()
    
    labelImageView.image = UIImage(named: "premium")
    tipsLabel.text="dfasdfasdfsdfsdfa12222222222222222222222222222222222222"
    //tipsLabel.pauseScroll()
    tipsLabel.setScroll(true)
  }
  override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
    //print("tou	ches - began - swift version")
    print("touch ches")
    for touch in touches{
//      var point = touch.locationInView(self)
      let bol = CGRectContainsPoint(tipsLabel.bounds, touch.locationInView(self.tipsLabel))
      print(bol)
      if bol{
        self.tipsLabel.autoScroll = true;
        //self.tipsLabel.pauseScroll()
        touchPoint = touch.locationInView(self.tipsLabel)
        touchTime = CACurrentMediaTime()
      }
    }
    
    
    
  }
  override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
    if(touchPoint==nil){
      return;
    }
    print(CACurrentMediaTime())
    //ß
    for touch in touches{
      let point = touch.locationInView(self.tipsLabel)
      //if(CACurrentMediaTime()-touchTime>0.5){
        print("pressed");
        _touchPressed = true
        self.tipsLabel.pauseScroll()
        self.tipsLabel.move(point,dest:touchPoint)
      //}
      
      touchPoint = point
      //print(touchPoint.x-point.x)
      
    }
  }
  override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
    for touch in touches{
      //      var point = touch.locationInView(self)
      let bol = CGRectContainsPoint(tipsLabel.bounds, touch.locationInView(self.tipsLabel))
      print(bol)
      if bol{
        if(_touchPressed != nil && _touchPressed==true){
        
        }else{
          if(self.tipsLabel.scrolling){
            self.tipsLabel.pauseScroll()
          }else{
            self.tipsLabel.resumeScroll();
          }
        }
      }
      
      touchPoint = nil
      _touchPressed = false
    }
    
  }
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    
    reload()
  }
  
  func reload(){
    //var img=self.imgTitle
  }
  
  @IBAction func didTouchDownListButton(sender: AnyObject){
    
    if(tipsLabel.scrolling){
      tipsLabel.stopScroll()
      //tipsLabel.setScrolling(false)
    }else{
      tipsLabel.resumeScroll()
    }
  }
}
