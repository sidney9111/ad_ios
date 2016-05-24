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
import StoreKit
/*
 不知道什么原因，但是连线payment后显示的view，不走prepare reuse方法
 不确定prepare reuse方法什么情况下触发｜不触发
 如果在此方法设置背景，会导致后加的cell会没背景
 所以在set product属性时设置背景
 */
class ProductCell: UITableViewCell {
  static let priceFormatter: NSNumberFormatter = {
    let formatter = NSNumberFormatter()
    
    formatter.formatterBehavior = .Behavior10_4
    formatter.numberStyle = .CurrencyStyle
    
    return formatter
  }()

  var buyButtonHandler: ((product: SKProduct) -> ())?
  var runButtonHandler: (()->())?
  var product: SKProduct? {
    didSet {
      guard let product = product else { return }
      let count = RageProducts.store.count(product.productIdentifier);
      textLabel?.text = product.localizedTitle + "(" + String(count) + ")"
      
//      if(count>0){
//        ProductCell.priceFormatter.locale = product.priceLocale
//        detailTextLabel?.text = ProductCell.priceFormatter.stringFromNumber(product.price)
//        print("product count")
//        print(count)
//        accessoryType = .None
//        accessoryView = self.newBuyButton()

      if RageProducts.store.isProductPurchased(product.productIdentifier) {
        accessoryType = .Checkmark
        accessoryView = nil
        detailTextLabel?.text = ""
      } else if IAPHelper.canMakePayments() {
        ProductCell.priceFormatter.locale = product.priceLocale
        detailTextLabel?.text = ProductCell.priceFormatter.stringFromNumber(product.price)
        
        accessoryType = .None
        accessoryView = self.newBuyButton()
      } else {
        detailTextLabel?.text = "Not available"
      }
      
      var image = UIImage(named: "buy_gas")
      image = image!.resizableImageWithCapInsets(UIEdgeInsetsMake(5, 5, 5, 5))
      self.backgroundView = UIImageView(image:image)

    }
  }
  
  var gas:Int?{
    didSet{
      
      detailTextLabel?.text = String(gas)
      
      let button = UIButton(type: .System)
      button.setTitleColor(tintColor, forState: .Normal)
      button.setTitle("Run", forState: .Normal)
      button.addTarget(self,action: #selector(ProductCell.runButtonClick(_:)), forControlEvents: .TouchUpInside)
      button.sizeToFit()
      accessoryView = button
    }
  }
  func runButtonClick(sender: AnyObject){
    print("product cell run event")
    //runButtonHandler?(gas:gas!)
    runButtonHandler?()
  }
  override func prepareForReuse() {
    super.prepareForReuse()
    
    textLabel?.text = ""
    detailTextLabel?.text = ""
    accessoryView = nil
    
    var image = UIImage(named: "buy_gas_9")
    image = image!.resizableImageWithCapInsets(UIEdgeInsetsMake(5, 5, 5, 5))
    self.backgroundView = UIImageView(image:image)

  }
  
  func newBuyButton() -> UIButton {
    let button = UIButton(type: .System)
    button.setTitleColor(tintColor, forState: .Normal)
    button.setTitle("Buy", forState: .Normal)
    button.addTarget(self,action: #selector(ProductCell.buyButtonTapped(_:)), forControlEvents: .TouchUpInside)
    button.sizeToFit()
    
    return button
  }
  
  func buyButtonTapped(sender: AnyObject) {
    buyButtonHandler?(product: product!)
  }
}