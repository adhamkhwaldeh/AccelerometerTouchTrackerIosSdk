//
//  AppDelegate.m
//  CodeExample
//

#import "AppDelegate.h"
#import "SampleApp.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"sbIDStartViewController"];
    
    UINavigationController *navCtrlr = [[UINavigationController alloc]initWithRootViewController:vc];
    [self.window setRootViewController:navCtrlr];
    navCtrlr.navigationBarHidden = YES;


    SampleApp* sampleApp = [SampleApp sharedSampleApp];


    return YES;
}


@end
