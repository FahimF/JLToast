# SwiftToast - Toast Notifications for Swift

This is a fork of the **JLToast** project which adds some additional functionality missing from the original. 

**SwiftToast** makes it easy to add Toast notifications to your iOS application. **SwiftToast** allows you to globally configure the appearance of your toast and specify the position on screen where the toast will appear so that you don't have to do tedious configuration for each of your new Toast instances.

## At a glance

Just see below:

```swift
Toast.makeToast("Some text").show()
```

To configure **SwiftToast**, just get an instance of the `ToastConfig` singleton object and then set the properties that you want on it. Those properties will be used throughought your app in creating new **SwiftTotast** instances.

## Installation

Add all the files from the `SwiftToast` sub-folder to your project. Check the included Swift and Objective-C sample projects to see examples if you run into any issues.

## Setting duration and delay

```swift
Toast.makeToast("Some text", duration:ToastConfig.durationLong)
Toast.makeToast("Some text", delay:1, duration:ToastConfig.durationShort)
```

It's as simple as that!

## Screenshots

![First Screenshot](https://raw.github.com/FahimF/SwiftToast/master/Screenshots/SwiftToast-Screenshot-1.png)
<br />
![Second Screenshot](https://raw.github.com/FahimF/SwiftToast/master/Screenshots/SwiftToast-Screenshot-2.png)
<br />
![Third Screenshot](https://raw.github.com/FahimF/SwiftToast/master/Screenshots/SwiftToast-Screenshot-3.png)

SwiftToast is under DWYWPL - Do What You Will Public License :) Do whatever you want either personally or commercially with the code but if you'd like, feel free to attribute in your app.