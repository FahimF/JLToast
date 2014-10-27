/*
 * RootViewController.swift
 *
 * Original code by Su Yeol Jeon 2013-2014.
 * Branched and modified by Fahim Farook 2014 to add additional functionality which did
 * not meet with original author's requirements/specifications
 *
 */

import UIKit

class RootViewController: UIViewController {
	@IBAction func buttonTapped() {
		Toast.makeToast("Basic SwiftToast").show()
		// Second toast - you normally don't have to do this, this is just for chaining toasts with a delay
		var delay = 2.5 * Double(NSEC_PER_SEC)
		var time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
		dispatch_after(time, dispatch_get_main_queue()) {
			Toast.makeToast("You can set a pre-set duration or a duration value in seconds.", duration:ToastConfig.durationNormal, position:ToastConfig.positionTop).show()
		}
		// Third toast
		delay = 6.5 * Double(NSEC_PER_SEC)
		time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
		dispatch_after(time, dispatch_get_main_queue()) {
			Toast.makeToast("With delay, SwiftToast will be shown after a delay.", delay:1, duration:5, position:ToastConfig.positionDefault).show()
		}
    }
}
