/*
 * JLToast.swift
 *
 * Original code by Su Yeol Jeon 2013-2014.
 * Branched and modified by Fahim Farook 2014 to add additional functionality which did
 * not meet with original author's requirements/specifications
 *
 *
 */

import UIKit

public enum JLToastPosition {
	case Top, Bottom
}

public struct JLToastDelay {
    public static let ShortDelay: NSTimeInterval = 2.0
    public static let LongDelay: NSTimeInterval = 3.5
}

public struct JLToastViewValue {
    static var FontSize: CGFloat {
        get { return UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone ? 12 : 16 }
    }
    
    static var PortraitOffsetY: CGFloat {
        get { return UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone ? 30 : 60 }
    }
    
    static var LandscapeOffsetY: CGFloat {
        get { return UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone ? 20 : 40 }
    }
}

@objc public class JLToast: NSOperation {
    var _view: JLToastView?
    
    var text: String {
        get { return _view!._textLabel!.text! }
        set { _view!._textLabel!.text = newValue }
    }

    var delay: NSTimeInterval?
    var duration: NSTimeInterval?
    
    override public var executing: Bool {
        get { return _executing }
        set {
            willChangeValueForKey("isExecuting")
            _executing = newValue
            didChangeValueForKey("isExecuting")
        }
    }
    var _executing: Bool = false
    
    override public var finished: Bool {
        get { return _finished }
        set {
            willChangeValueForKey("isFinished")
            _finished = newValue
            didChangeValueForKey("isFinished")
        }
    }
    var _finished: Bool = false
    
    
	public class func makeText(text:String, position:JLToastPosition = JLToastPosition.Top, duration:NSTimeInterval = JLToastDelay.ShortDelay, delay:NSTimeInterval = 0) -> JLToast {
		var toast = JLToast()
		toast.text = text
		toast._view?._position = position
		toast.delay = delay
		toast.duration = duration
		return toast
    }
	
    override init() {
        _view = JLToastView()
    }
    
    public func show() {
        JLToastCenter.defaultCenter().addToast(self)
    }
    
    override public func start() {
        if !NSThread.isMainThread() {
            dispatch_async(dispatch_get_main_queue(), { () in self.start() })
        } else {
            super.start()
        }
    }
    
    override public func main() {
        executing = true
        
        dispatch_async(dispatch_get_main_queue(), { () in
			self._view!.updateView()
			self._view!.alpha = 0
			UIApplication.sharedApplication().keyWindow?.subviews.first?.addSubview(self._view!)
            UIView.animateWithDuration(0.5,
                delay: self.delay!,
                options: UIViewAnimationOptions.BeginFromCurrentState,
                animations: { () in self._view!.alpha = 1 },
                completion: { (completed: Bool) in
                    UIView.animateWithDuration(self.duration!,
                        animations: { () in self._view!.alpha = 1.0001 },
                        completion: { (completed: Bool) in
                            self.finish()
                            UIView.animateWithDuration(0.5, animations: { () in self._view!.alpha = 0 })
                    })
            })
        })
    }
    
    public func finish() {
        executing = false
        finished = true
    }
}