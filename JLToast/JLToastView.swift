/*
 * JLToastView.swift
 *
 * Original code by Su Yeol Jeon 2013-2014.
 * Branched and modified by Fahim Farook 2014 to add additional functionality which did
 * not meet with original author's requirements/specifications
 *
 *
 */

import UIKit
import QuartzCore

@objc public class JLToastView: UIView {
    var vwBG = UIView()
    var lblToast = UILabel(frame:CGRectMake(0, 0, 100, 100))
    var insetText = UIEdgeInsetsMake(6, 10, 6, 10)
	var position:Int!
    
	init(text:String, position:Int) {
        super.init(frame: CGRectMake(0, 0, 100, 100))
		let opt = JLToastConfig.sharedInstance()
		self.position = position == JLToastConfig.positionDefault ? opt.position : position
        vwBG.frame = self.bounds
        vwBG.backgroundColor = opt.bgColour
		vwBG.layer.cornerRadius = 5
		vwBG.layer.borderColor = opt.borderColour.CGColor
		vwBG.layer.borderWidth = opt.borderWidth
		if opt.showShadow {
			vwBG.layer.shadowOffset = CGSize(width:2.0, height:2.0)
			vwBG.layer.shadowOpacity = opt.shadowOpacity
		}
//        vwBG.clipsToBounds = true
        self.addSubview(vwBG)
        
        lblToast.textColor = opt.textColour
        lblToast.backgroundColor = UIColor.clearColor()
        lblToast.font = UIFont.systemFontOfSize(opt.textSize)
        lblToast.numberOfLines = 0
        lblToast.textAlignment = NSTextAlignment.Center;
		lblToast.text = text
        self.addSubview(lblToast)
    }

	required public init(coder aDecoder:NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
    
    func updateView() {
        let deviceWidth = CGRectGetWidth(UIScreen.mainScreen().bounds)
        let font = self.lblToast.font
        let constraintSize = CGSizeMake(deviceWidth * (280.0 / 320.0), CGFloat.max)
        var textLabelSize = self.lblToast.sizeThatFits(constraintSize)
        self.lblToast.frame = CGRect(
            x: self.insetText.left,
            y: self.insetText.top,
            width: textLabelSize.width,
            height: textLabelSize.height
        )
        self.vwBG.frame = CGRect(
            x: 0,
            y: 0,
            width: self.lblToast.frame.size.width + self.insetText.left + self.insetText.right,
            height: self.lblToast.frame.size.height + self.insetText.top + self.insetText.bottom
        )
        
		var x: CGFloat
		var y: CGFloat
		var wd:CGFloat
		var ht:CGFloat
		
		var width = vwBG.frame.size.width
		var height = vwBG.frame.size.height
		let sz = UIScreen.mainScreen().bounds.size
		let orientation = UIApplication.sharedApplication().statusBarOrientation
		let sver = UIDevice.currentDevice().systemVersion as NSString
		let ver = sver.floatValue
		if UIInterfaceOrientationIsLandscape(orientation) && ver < 8.0 {
			wd = sz.height
			ht = sz.width
			y = JLToastViewValue.LandscapeOffsetY
		} else {
			wd = sz.width
			ht = sz.height
			if UIInterfaceOrientationIsLandscape(orientation) {
				y = JLToastViewValue.LandscapeOffsetY
			} else {
				y = JLToastViewValue.PortraitOffsetY
			}
		}
		x = (wd - width) * 0.5
		if position == JLToastConfig.positionBottom {
			y = ht - (height + y)
		}
        self.frame = CGRectMake(x, y, width, height);
    }
    
    override public func hitTest(point: CGPoint, withEvent event: UIEvent!) -> UIView? {
        return nil
    }
}
