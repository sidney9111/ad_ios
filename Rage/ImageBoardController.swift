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
    tipsLabel.text="dfasdfasdfsdfsdfa"
    
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    
    reload()
  }
  
  func reload(){
    //var img=self.imgTitle
  }
}
