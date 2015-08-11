//
//  PhysicsView.swift
//  newton
//
//  Created by Mark Aron Szulyovszky on 3/11/15.
//  Copyright (c) 2015 itchingpixels. All rights reserved.
//

import UIKit


class PhysicsView: UIView {
  
  private var animator: UIDynamicAnimator!
  private var gravity: UIGravityBehavior!
  private var collision: UICollisionBehavior!
  private var attachment: UIAttachmentBehavior!
  
  private var views = [MessageView]()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    commonInit()
  }
  
  private func commonInit () {
    
    animator = UIDynamicAnimator(referenceView: self)
    
    gravity = UIGravityBehavior(items: [])
    gravity.magnitude = 10
    //        // upside down gravity?:)
    //        gravity.gravityDirection = CGVector(dx: 0, dy: -0.8)
    animator.addBehavior(gravity)
    
    layer.masksToBounds = true
    
    // SO WHAT IF WE TRY IT WITHOUT GRAVITY?
    
    collision = UICollisionBehavior(items: [])
    collision.translatesReferenceBoundsIntoBoundary = true
    collision.collisionMode = .Everything
    animator.addBehavior(collision)
    
  }
  
  
  func addMessage(message: String) {
    
    let messageView = MessageView(frame: CGRectMake(self.width*0.25, self.height-60, self.width/2, 44), message: Message(sender: "me", text: message, createdAt: NSDate()))
    
    let pan = UIPanGestureRecognizer(target: self, action: "pan:")
    messageView.addGestureRecognizer(pan)
    
    let dynamicProperties = UIDynamicItemBehavior(items: [messageView])
    dynamicProperties.elasticity = 0.2
    dynamicProperties.allowsRotation = true
    dynamicProperties.density = 5
    dynamicProperties.resistance = 0.9
    dynamicProperties.friction = 0.6
    
    let pushUp = UIPushBehavior(items: self.views, mode: UIPushBehaviorMode.Instantaneous)
    pushUp.pushDirection = CGVector(dx: 0, dy: -20)
    animator.addBehavior(pushUp)
    
    addSubview(messageView)
    
    gravity.addItem(messageView)
    collision.addItem(messageView)
    animator.addBehavior(dynamicProperties)
    
    views.append(messageView)
  }
  
  

  
  
  func pan(gesture: UIPanGestureRecognizer) {
    
    let touchedView = gesture.view
    let location = gesture.locationInView(self)
    
    switch (gesture.state) {
    case .Began:
      let offsetFromCenter = UIOffset(horizontal: location.x - touchedView!.center.x, vertical: location.y - touchedView!.center.y)
      attachment = UIAttachmentBehavior(item: touchedView!,offsetFromCenter: offsetFromCenter, attachedToAnchor: location)
      attachment.length = 0.2
      attachment.damping = 0
      attachment.frequency = 0
      animator.addBehavior(self.attachment)
    case .Changed:
      attachment!.anchorPoint = gesture.locationInView(self)

    case .Ended, .Cancelled:
      animator.removeBehavior(self.attachment)
      attachment = nil
    default: ()
    }

    
  }
}





