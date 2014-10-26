/*
 * JLToastCenter.swift
 *
 * Original code by Su Yeol Jeon 2013-2014. 
 * Branched and modified by Fahim Farook 2014 to add additional functionality which did
 * not meet with original author's requirements/specifications
 *
 *
 */

import UIKit

@objc public class JLToastCenter: NSObject {

    private var _queue = NSOperationQueue()

    private class var _defaultCenter: JLToastCenter {
        struct Singleton {
            static let instance = JLToastCenter()
        }
        return Singleton.instance
    }
    
    public class func defaultCenter() -> JLToastCenter {
        return JLToastCenter._defaultCenter
    }
    
    override init() {
        super.init()
        _queue.maxConcurrentOperationCount = 1
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "deviceOrientationDidChange:",
            name: UIDeviceOrientationDidChangeNotification,
            object: nil
        )
    }
    
    public func addToast(toast: JLToast) {
        _queue.addOperation(toast)
    }
    
    func deviceOrientationDidChange(sender: AnyObject?) {
        if _queue.operations.count > 0 {
            let lastToast: JLToast = _queue.operations[0] as JLToast
            lastToast._view!.updateView()
        }
    }
}
