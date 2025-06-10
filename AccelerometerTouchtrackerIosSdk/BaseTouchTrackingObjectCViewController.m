//
//  BaseTouchTrackingViewController.m
//  AccelerometerTouchtrackerIosSdk
//
//  Created by adham khwaldeh on 9/6/25.
//

#import "BaseTouchTrackingObjectCViewController.h"

@implementation BaseTouchTrackingObjectCViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        _listeningEnabled = YES;
//        isListeningEnabled = YES;
    }
    return self;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    if (self.isListeningEnabled && event.allTouches.count > 0) {
        [self handleTouchEvent:event];
    }
}

- (void)handleTouchEvent:(UIEvent *)event {
    // Abstract: Subclasses should override this method
    // Optionally, you can use NSAssert or raise an exception to enforce override
    // NSAssert(NO, @"Subclasses must override handleTouchEvent:");
}

- (void)startListening { self.listeningEnabled = YES; }

- (void)stopListening { self.listeningEnabled = NO; }

@end
