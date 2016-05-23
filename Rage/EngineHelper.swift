//
//  EngineHelper.swift
//  Rage
//
//  Created by Comp01 on 23/5/16.
//  Copyright © 2016年 Razeware LLC. All rights reserved.
//

import Foundation
//public struct EngineHelper{
//  //public static
//}
class EngineHelper:NSObject{
  private static let _engineHelper:EngineHelper = EngineHelper()
  class func instance()->EngineHelper!{

   return _engineHelper
  }
  
  func plusFuel(){
    var count = NSUserDefaults.standardUserDefaults().integerForKey("fuelcount")
    count-=1
    NSUserDefaults.standardUserDefaults().setInteger(count, forKey: "Int")
  }
  func minusFuel(){
    var count = NSUserDefaults.standardUserDefaults().integerForKey("fuelcount")
    count+=1
    NSUserDefaults.standardUserDefaults().setInteger(count, forKey: "Int")
  }
  
  func counting() -> Int {
  
    return 100
  
  }
}