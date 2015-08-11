//
//  PhysicsViewController.swift
//  newton
//
//  Created by Mark Aron Szulyovszky on 3/12/15.
//  Copyright (c) 2015 itchingpixels. All rights reserved.
//

import UIKit

class PhysicsViewController: UIViewController {

    @IBOutlet weak var physicsView: PhysicsView!
    @IBOutlet weak var input: UITextField!
  
    override func viewDidLoad() {
			
			self.input.addDoneOnKeyboardWithTarget(self, action: "done")
			
    }

  
	func done() {
		self.physicsView.addMessage(self.input.text!)
		self.input.text = ""
		self.input.resignFirstResponder()

	}

}
