//
//  MainViewController.m
//  CodeExample
//

#import "MainViewController.h"
#import "SampleApp.h"
@import AccelerometerTouchTrackerSdk;

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // This ViewController is just a placeholder in this sample; nothing to do.
}

- (IBAction)LogoutButtonTouched:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
