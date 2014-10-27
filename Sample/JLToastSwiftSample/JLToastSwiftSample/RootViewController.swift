/*
 * RootViewController.swift
 *
 *            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
 *                    Version 2, December 2004
 *
 * Copyright (C) 2013-2014 Suyeol Jeon <devxoul@gmail.com>
 *
 * Everyone is permitted to copy and distribute verbatim or modified
 * copies of this license document, and changing it is allowed as long
 * as the name is changed.
 *
 *            DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
 *   TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
 *
 *  0. You just DO WHAT THE FUCK YOU WANT TO.
 *
 */

import UIKit

class RootViewController: UIViewController {
	@IBAction func buttonTapped() {
		JLToast.makeText("Basic JLToast").show()
        JLToast.makeText("You can set duration. `JLToastDelay.ShortDelay` means 2 seconds.\n" +
			"`JLToastDelay.LongDelay` means 3.5 seconds.", duration: JLToastDurationLong, position:JLToastPositionTop).show()
        JLToast.makeText("With delay, JLToast will be shown after delay.", delay:1, duration:5).show()
    }
}
