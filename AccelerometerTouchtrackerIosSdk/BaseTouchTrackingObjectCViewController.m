//
//  BaseTouchTrackingViewController.m
//  AccelerometerTouchtrackerIosSdk
//
//  Created by adham khwaldeh on 9/6/25.
//

#import "BaseTouchTrackingObjectCViewController.h"

@implementation BaseTouchTrackingObjectCViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    if (event.allTouches.count > 0) {
        [self handleTouchEvent:event];
    }
}

- (void)handleTouchEvent:(UIEvent *)event {
    // Abstract: Subclasses should override this method
    // Optionally, you can use NSAssert or raise an exception to enforce override
    // NSAssert(NO, @"Subclasses must override handleTouchEvent:");
}

@end
