//
//  MainViewController.m
//  CodeExample
//

#import "MainViewController.h"
#import "SampleApp.h"
@import AccelerometerTouchtrackerIosSdk;
@import CoreMotion;

@interface MainViewController () <AccelerometerManagerDelegate>
@property (nonatomic, strong) AccelerometerManager *accelerometerManager;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.accelerometerManager = [[AccelerometerManager alloc] init];
    self.accelerometerManager.delegate = self;
    [self.accelerometerManager startListeningWithUpdateInterval:0.1];
}

- (void)dealloc {
    [self.accelerometerManager stopListening];
}


// Delegate method for receiving data
- (void)accelerometerManagerWith:(AccelerometerManager * _Nonnull)manager didReceiveData:(CMAccelerometerData * _Nonnull)data {
    NSLog(@"Accelerometer data: x=%f, y=%f, z=%f", data.acceleration.x, data.acceleration.y, data.acceleration.z);
}

// Delegate method for error
- (void)accelerometerManagerWith:(AccelerometerManager * _Nonnull)manager didFailWithError:(enum AccelerometerListenerError)error {
        NSLog(@"Accelerometer error: %ld", (long)error);
}


- (void)handleTouchEvent:(UIEvent *)event {
    printf(@"MainViewController: handleTouchEvent called with event: %@", event);
    // Abstract: Subclasses should override this method
    // Optionally, you can use NSAssert or raise an exception to enforce override
    // NSAssert(NO, @"Subclasses must override handleTouchEvent:");
}

- (IBAction)LogoutButtonTouched:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}





@end
