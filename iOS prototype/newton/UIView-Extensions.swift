//
//  UIView-Extension.swift
//  newton
//
//  Created by Mark Aron Szulyovszky on 07/08/2015.
//  Copyright (c) 2015 itchingpixels. All rights reserved.
//

import Foundation

extension UIView {
  
  var width: CGFloat {
    get {
      return self.frame.width
    } set {
      self.frame = CGRect(x: self.frame.minX, y: self.frame.minY, width: newValue, height: self.frame.height)
    }
  }
  
  var height: CGFloat {
    get {
      return self.frame.height
    } set {
      self.frame = CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.width, height: newValue)
    }
  }
  
  var x: CGFloat {
    get {
      return self.frame.minX
    } set {
      self.frame = CGRect(x: newValue, y: self.frame.minY, width: self.frame.width, height: self.frame.height)
    }
  }
  
  var y: CGFloat {
    get {
      return self.frame.width
    } set {
      self.frame = CGRect(x: self.frame.minX, y: newValue, width: self.frame.width, height: self.frame.height)
    }
  }

}