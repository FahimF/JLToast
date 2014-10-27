//
//  JLToastConfig.swift
//  JLToast
//
//  Created by Fahim Farook on 10/27/14.
//  Copyright (c) 2014 Fahim Farook. All rights reserved.
//

import UIKit

@objc public class JLToastConfig: NSObject {
	// Constants
	let isPhone = UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone
	
	// Variables
	var duration:NSTimeInterval!
	var delay:NSTimeInterval!
	var position:Int!
	var bgColour = UIColor.blackColor()
	var borderColour = UIColor.grayColor()
	var borderWidth:CGFloat = 1.0
	var showShadow = true
	var shadowOpacity:Float = 0.7
	var textColour = UIColor.whiteColor()
	var baseSize:CGFloat = 14

	var textSize:CGFloat {
		get {
			if isPhone {
				return baseSize
			} else {
				return baseSize * 1.3
			}
		}
		set(newSize) {
			baseSize = newSize
		}
	}
	
	struct Static {
		static var instance:JLToastConfig? = nil
		static var token:dispatch_once_t = 0
	}
	
	class func sharedInstance() -> JLToastConfig! {
		dispatch_once(&Static.token) {
			Static.instance = self()
		}
		return Static.instance!
	}
	
	// Position constants - this is needed to use values from Objective-C
	public class var positionDefault:Int {
		return 0
	}

	public class var positionTop:Int {
		return 1
	}

	public class var positionBottom:Int {
		return 2
	}
	
	// Duration constants
	public class var durationDefault:NSTimeInterval {
		return -1
	}
	
	public class var durationShort:NSTimeInterval {
		return 2.0
	}
	
	public class var durationNormal:NSTimeInterval {
		return 5.0
	}
	
	public class var durationLong:NSTimeInterval {
		return 8.0
	}
	
	// Delay constants
	public class var delayDefault:NSTimeInterval {
		return -1
	}
	
	public class var delayNone:NSTimeInterval {
		return 0.0
	}
	
	public class var delayShort:NSTimeInterval {
		return 2.0
	}
	
	public class var delayLong:NSTimeInterval {
		return 3.5
	}
	
	required override public init() {
		assert(Static.instance == nil, "Singleton already initialized!")
		super.init()
		duration = JLToastConfig.durationShort
		delay = JLToastConfig.delayNone
		position = JLToastConfig.positionBottom
	}
}
