//
//  physicsLabel.swift
//  newton
//
//  Created by Mark Aron Szulyovszky on 3/11/15.
//  Copyright (c) 2015 itchingpixels. All rights reserved.
//

import Foundation
import UIKit

class MessageView: UILabel {
  
  let message: Message
  
  init(frame: CGRect, message: Message) {
    self.message = message
    super.init(frame: frame)
    
    backgroundColor = UIColor(rgba: "#2599FA")
    text = message.text
    textAlignment = .Center
    textColor = UIColor.whiteColor()
    userInteractionEnabled = true
    
    layer.cornerRadius = frame.height/2
    layer.masksToBounds = true
    
    bounds = CGRect(x: frame.origin.x, y: frame.origin.y, width: intrinsicContentSize().width+20, height: intrinsicContentSize().height+20)
  }
  
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
}