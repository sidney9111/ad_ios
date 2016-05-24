/*
* Copyright (c) 2016 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView?
  @IBOutlet weak var tipsLabel: UILabel?
  @IBOutlet weak var timeLabel: UILabel?
  @IBOutlet weak var nav: UINavigationBar?
  var image: UIImage? {
    didSet {
      configureView()
    }
  }
  var text: String?{
    didSet{
      
      configureView()
      
      
      
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureView()
    //self.presentedViewController?.presentingViewController!
    
    //title = "Details"
    let restoreButton = UIBarButtonItem(title: "Restore", style: .Plain, target: self, action: #selector(DetailViewController.back(_:)))
    //navigationItem.rightBarButtonItem = restoreButton
    nav?.topItem?.leftBarButtonItem = restoreButton
    nav?.topItem?.title = "Details"
  }
  func back(sender: AnyObject) -> Bool {
    print("b")
    return true
  }
  func configureView() {
    imageView?.image = image
    //tipsLabel?.text = text
    if(text=="runcar"){
      tipsLabel?.text = "spend a can of gas to run the car, enjoy the jounary"
      //timeLabel?.enabled = true
      timeLabel?.text = String(EngineHelper.instance().counting())
    }
    else{
      //configureView()
      tipsLabel?.text = text
    }

  }
}
