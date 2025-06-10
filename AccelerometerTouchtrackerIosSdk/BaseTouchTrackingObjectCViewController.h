//
//  BaseTouchTrackingViewController.h
//  AccelerometerTouchtrackerIosSdk
//
//  Created by adham khwaldeh on 9/6/25.
//

#import <UIKit/UIKit.h>

@protocol ControllerTouchDelegate <NSObject>
@optional
- (void)handleTouchEvent:(UIEvent *)event;
@end

@interface BaseTouchTrackingObjectCViewController : UIViewController <ControllerTouchDelegate>

@property (nonatomic, assign, getter=isListeningEnabled) BOOL listeningEnabled;

- (void)startListening;
- (void)stopListening;

@end
