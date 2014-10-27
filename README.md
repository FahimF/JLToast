# JLToast - Written in Swift

This is a fork of the original **JLToast** which adds some additional functionality missing from the original project. 

**JLToast** makes it easy to use Toast in iOS with very simple interface. This fork also allows you to globally configure the appearance of your toast and to specify the position on screen where the toast will appear.


## At a glance

Just see below:

```swift
JLToast.makeText("Some text").show()
```

To configure **JLToast**, just get an instance of the `JLToastConfig` global object and then set the properties that you want on it. Those properties will be used throughought your app in creating new **JLTotast** instances.

## Installation

Add all the files from the JLToast sub-folder to your project. Check the included Swift and Objective-C sample projects to see examples if you run into any issues.

## Setting duration and delay

```swift
JLToast.makeText("Some text", duration: JLToastDelay.LongDelay)
JLToast.makeText("Some text", delay: 1, duration: JLToastDelay.ShortDelay)
```

How easy!

## Screenshots

![First Screenshot](https://raw.github.com/FahimF/JLToast/master/Screenshots/SwiftToast-Screenshot-1.png)
<br />
![Second Screenshot](https://raw.github.com/FahimF/JLToast/master/Screenshots/SwiftToast-Screenshot-2.png)
<br />
![Third Screenshot](https://raw.github.com/FahimF/JLToast/master/Screenshots/SwiftToast-Screenshot-3.png)

This fork of JLToast is under DWYWPL - Do What You Will Public License :) Do whatever you want either personally or commercially with the code but if you'd like, feel free to attribute in your app.