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
	
	@IBAction func showToast1() {
		Toast.makeToast("Basic SwiftToast", position:ToastConfig.positionDefault, offset:48).show()
	}
	
	@IBAction func showToast2() {
		Toast.makeToast("You can set a pre-set duration or a duration value in seconds.", duration:ToastConfig.durationNormal, position:ToastConfig.positionTop, offset:66).show()
	}
	
	@IBAction func showToast3() {
		Toast.makeToast("With delay, SwiftToast will be shown after a delay.", delay:1, duration:5, position:ToastConfig.positionCenter, offset:ToastConfig.offsetDefault).show()
	}
}
