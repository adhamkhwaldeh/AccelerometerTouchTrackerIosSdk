//
//  main.m
//  CodeExample
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
//#import "TouchTrackingApplication.h"
#import "CodeExample-Swift.h" // Import your app's generated Swift header
@import AccelerometerTouchTrackerSdk;





int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
//    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
    return UIApplicationMain(argc, argv, NSStringFromClass([TouchTrackingApplication class]), appDelegateClassName);
}
