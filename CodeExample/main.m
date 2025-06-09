//
//  main.m
//  CodeExample
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "SampleApp.h"
//#import "TouchTrackingApplication.h"
#import "CodeExample-Swift.h" // Import your app's generated Swift header
@import AccelerometerTouchtrackerIosSdk;




int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
//    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
//    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
    
//    return UIApplicationMain(argc, argv,NSStringFromClass([SampleApp class]), appDelegateClassName);
    
     return UIApplicationMain(argc, argv, NSStringFromClass([TouchApplication class]), appDelegateClassName);
}
