/*
 *
 * Original code by Su Yeol Jeon 2013-2014.
 * Branched and modified by Fahim Farook 2014 to add additional functionality which did
 * not meet with original author's requirements/specifications
 *
 */

#import "AppDelegate.h"
#import "SwiftToastObjcSample-Swift.h"

@implementation AppDelegate

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	// Configure SwiftToast
	ToastConfig *opt = [ToastConfig sharedInstance];
	opt.bgColour = [UIColor colorWithRed:0.61 green:0.953 blue:0.979 alpha:1.0];
	opt.borderColour = [UIColor colorWithRed:0.0 green:0.341 blue:0.678 alpha:1.0];
	opt.textColour = [UIColor blackColor];
    return YES;
}

@end
