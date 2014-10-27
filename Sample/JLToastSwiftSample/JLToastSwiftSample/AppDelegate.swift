/*
 * AppDelegate.swift
 *
 * Original code by Su Yeol Jeon 2013-2014.
 * Branched and modified by Fahim Farook 2014 to add additional functionality which did
 * not meet with original author's requirements/specifications
 *
 */

import Foundation
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
		// Configure JLToast
		let opt = JLToastConfig.sharedInstance()
		opt.bgColour = UIColor(red:0.61, green:0.953, blue:0.979, alpha:1.0)
		opt.borderColour = UIColor(red:0.0, green:0.341, blue:0.678, alpha:1.0)
		opt.textColour = UIColor.blackColor()
        return true
    }
}