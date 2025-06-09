//
//  AppDelegate.m
//  CodeExample
//

#import "AppDelegate.h"
#import "SampleApp.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(SampleApp *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"sbIDStartViewController"];
   
    TouchWindow *window = [[TouchWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  
    
    __weak typeof(self) weakSelf = self;

    window.onTouchesEvent = ^(NSSet<UITouch *> *touches, UIEvent *event) {
        // This block runs on every touch event
        for (UITouch *touch in touches) {
            CGPoint location = [touch locationInView:window];
            
            switch (touch.phase) {
                case UITouchPhaseBegan:
                    NSLog(@"[Callback] Touch began at %@", NSStringFromCGPoint(location));
                    break;
                case UITouchPhaseMoved:
                    NSLog(@"[Callback] Touch moved at %@", NSStringFromCGPoint(location));
                    break;
                case UITouchPhaseEnded:
                    NSLog(@"[Callback] Touch ended at %@", NSStringFromCGPoint(location));
                    break;
                case UITouchPhaseCancelled:
                    NSLog(@"[Callback] Touch cancelled at %@", NSStringFromCGPoint(location));
                    break;
                default:
                    break;
            }
        }
    };

    self.window = window;
    
    UINavigationController *navCtrlr = [[UINavigationController alloc]initWithRootViewController:vc];
    [self.window setRootViewController:navCtrlr];
    navCtrlr.navigationBarHidden = YES;

 
//    application.
    SampleApp* sampleApp = [SampleApp sharedSampleApp];
//    SampleApp* sampleApp = [SampleApp sharedSampleApp];
//    sampleApp.onTouchesEvent = ^(NSSet<UITouch *> *touches, UIEvent *event) {
//            for (UITouch *touch in touches) {
//                CGPoint location = [touch locationInView:self.window];
//                
//                switch (touch.phase) {
//                    case UITouchPhaseBegan:
//                        NSLog(@"[BaseApplication] Touch began at %@", NSStringFromCGPoint(location));
//                        break;
//                    case UITouchPhaseMoved:
//                        NSLog(@"[BaseApplication] Touch moved at %@", NSStringFromCGPoint(location));
//                        break;
//                    case UITouchPhaseEnded:
//                        NSLog(@"[BaseApplication] Touch ended at %@", NSStringFromCGPoint(location));
//                        break;
//                    case UITouchPhaseCancelled:
//                        NSLog(@"[BaseApplication] Touch cancelled at %@", NSStringFromCGPoint(location));
//                        break;
//                    default:
//                        break;
//                }
//            }
//        };
//     

    return YES;
}

@end
