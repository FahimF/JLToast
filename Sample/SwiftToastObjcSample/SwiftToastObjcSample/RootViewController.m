//
//  RootViewController.m
//  SwiftToastObjcSample
//
//  Created by Fahim Farook on 10/27/14.
//  Copyright (c) 2014 Suyeol Jeon. All rights reserved.
//

#import "RootViewController.h"
#import "SwiftToastObjcSample-Swift.h"

@interface RootViewController ()

@end

@implementation RootViewController

-(IBAction)buttonTapped {
	[[Toast makeToast:@"Basic SwiftToast"] show];
	// Second toast - you normally don't have to do this, this is just for chaining toasts with a delay
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2.5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
		[[Toast makeToast:@"You can set a pre-set duration or a duration value in seconds." duration:ToastConfig.durationNormal] show];
	});
	// Third toast
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 6.5 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
		[[Toast makeToast:@"With delay, SwiftToast will be shown after delay." duration:5 delay:1] show];
	});
}

@end
