//
//  SampleApp.h
//  CodeExample
//

#import <UIKit/UIKit.h>
#import <AccelerometerTouchtrackerIosSdk/AccelerometerTouchtrackerIosSdk-Swift.h>
#import <AccelerometerTouchtrackerIosSdk/BaseTouchObjCApplication.h>
//#import <AccelerometerTouchtrackerIosSdk/BaseTouchObjCApplication.h>
//@interface SampleApp : BaseTouchApplication
//
//+ (id)sharedSampleApp;
//
//@end
@interface SampleApp :NSObject//UIApplication //BaseTouchObjCApplication//NSObject //
+ (id)sharedSampleApp;
@end

