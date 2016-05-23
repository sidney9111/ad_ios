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
    
    let array:NSArray = NSArray(array: ["聊胜于无。",
      "学得快，忘得快。",
      "熟得快，烂得快。",
      "能言是银，沉默是金。111111111111111111111111111111111111",
      "静水常深。",//5
      "趁热打铁。",
      "坚持就是胜利。",
      "既来之，则安之。","我并非失败，只是知道了这1万种方法不起作用。——美国发明家托马斯·爱迪生。",//9
      "记住，别因为失败而全盘否定自我。——美国作家金克拉","所谓成功，就是不停地经历失败，却始终保持热情。——英国政治家温斯顿·丘吉尔。",
      "一次的失败并不代表你会一事无成。——美国影星玛丽莲·梦露","成功没有秘诀，只是充分准备、辛勤付出和吸取失败教训之后的必然结果。——美国政治家科林·鲍威尔",
      "性。男人喜欢性，希望自己的女友也一样喜欢性，希望女人主动","男人排斥女人干涉自己的个人习惯，讨厌女人为一点点小事争吵。",//15
      "男人对女人讨厌的事情很在意。他会为了接近你，而告诉你自己不喜欢你讨厌的东西。","男人不喜欢女人玩的东西，他们宁愿吃玻璃也不愿看肥皂剧。",
      "失败是只是一个机会——让你重新开始的时候更明智。——美国企业家亨利·福特。","只有敢于经受重大挫折的人，才能获得伟大的成就。——美国政治家罗伯特·肯尼迪",
      "他人经历失败而放弃，我却经历失败而成长并更加努力。——德国作家阿曼达·戈尔","要赢得成功,你对成功的渴望必须超过你对失败的恐惧。——美国演员比尔·科斯比",//21
      "为成功而贺固然是好，但从失败中汲取经验更为重要。——美国微软创始人之一比尔·盖茨","不要将男人看的太死。一天只有24个小时，除了8小时睡觉，10小时工作，2小时公交，90分钟健身，90分钟做饭吃饭，洗澡，每天就只有1个小时是我们能在一起的。",
      "男人不是电热毯，不要总想着让他们给你暖床","男人对女人的付出和女人的魅力成正比的，如果你很美，我会愿意为你做每一件事，反之就难了。",
      "当女人说我们坐下来好好谈谈的时候，她们是在说“我很生气”。因为女人根本不会和我好好聊我喜欢的体育，所以男人知道女人想找他们的茬了。","男人讨厌约会。因为他们必须在约会上不停地撒谎。"])//27
    let arrayEng:NSArray = NSArray(array: ["Something is better than nothing.",
      "Soon learn, soon forgotten.",
      "TSoon ripe, soon rotten.",
      "Speech is silver, silence is gold.",
      "Still water run deep.",//5
      "Strike the iron while it is hot.",
      "Success belongs to the persevering.",
      "Take things as they come.",
      "I have not failed. I've just found 10,000 ways that won't work.– Thomas Edison",//9
      "Remember that failure is an event, not a person. – Zig Ziglar","Success is the ability to go from failure to failure without losing your enthusiasm. – Winston Churchill",
      "Just because you fail once doesn't mean you're gonna fail at everything. -Marilyn Monroe","There are no secrets to success. It is the result of preparation, hard work and learning from failure. – Colin Powell",
  "Yes, it's about sex. Men like sex, men like variety. Men like women that enjoy sex, enjoyvariety, and are active partners in sex. ","A man is less likely to feel romantic if a woman is making his life miserable. If you want to cuddle, don't start a fight over leaving the toilet seat up or not taking out the garbage, Buzzkill.",//15
      "Men are passionate about the things women hate. In general, when men tell you they don't like cartoons, stoner movies, action movies, motorcycles, South Park, sports, firearms, the Simpsons, and ESPN, etc. they are lying so that they can have sex with you. ","Men don't like women's entertainment. I'd rather eat glass than watch Bridget Jones, but I've watched it for sex.",
      "Failure is only the opportunity to begin again, only this time more wisely. – Henry Ford","Only those who dare to fail greatly can ever achieve greatly. – Robert F. Kennedy",
      "Some people experience failure and give up. I see it as a new way to grow and develop! – Amanda Gore","In order to succeed, your desire for success should be greater than your fear of failure. – Bill Cosby",//21
      "It is fine to celebrate success, but it is more important to heed the lessons of failure. – Bill Gates","There's only 24 hours in a day. Eight hours of sleep, ten hours at work, two hours commute, 90 minutes at the gym, and 90 minutes cooking, eating, and washing up leaves only one hour each day for \"us\" or \"me\" time. Keep your expectations reasonable and share. ",
      "Women have cold hands, feet, butts, and other body parts. Men are not your personal heaters. Warm them or keep them to yourself.","A man's willingness to put up with a women's b.s. is directly proportional to how hot they are. Yes, men will kiss a beautiful women's ass for sex, that doesn't mean you're going to get the same treatment.",
      "When women say they want to sit down and talk, men hear \"I'm pissed.\" You never want to talk about things we like, like sports, so telling us you want to talk sends us the signal that you want to bring up something that is bothering you. You might fool us once in a while by actually wanting to talk about something the other sex is interested in. Men have to, it is called dating.","Men hate dating because we have to lie. Lying isn't fun. We can't wait to be married so we can really tell you how we feel about Bridget Jones. Unless he's a jerk, a man's happiest day is when he no longer has to lie to have sex."])//27
    let userDefault = NSUserDefaults.standardUserDefaults()
    var iRoadMap = userDefault.integerForKey("iroadmap")
    if (iRoadMap==0){
      iRoadMap = 3
      userDefault.setInteger(iRoadMap, forKey: "iroadmap")
    }
    tipsLabel.text = array[iRoadMap] as! String
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
    //print(CACurrentMediaTime())
    
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
