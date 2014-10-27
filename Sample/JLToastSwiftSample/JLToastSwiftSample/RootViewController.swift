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
		JLToast.makeText("Basic JLToast").show()
        JLToast.makeText("You can set a pre-set duration or a duration value in seconds.", duration: JLToastConfig.durationLong, position:JLToastConfig.positionTop).show()
		JLToast.makeText("With delay, JLToast will be shown after a delay.", delay:1, duration:5, position:JLToastConfig.positionDefault).show()
    }
}
