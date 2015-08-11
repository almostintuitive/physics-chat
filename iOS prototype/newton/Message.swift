//
//  Message.swift
//  newton
//
//  Created by Mark Aron Szulyovszky on 3/12/15.
//  Copyright (c) 2015 itchingpixels. All rights reserved.
//

import Foundation

struct Message {
  
  var sender : String
  var text : String
  var createdAt : NSDate
  
  init(sender: String, text: String, createdAt: NSDate) {
    self.sender = sender
    self.text = text
    self.createdAt = createdAt
  }
  
  
}