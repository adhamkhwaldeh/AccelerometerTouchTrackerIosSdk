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

@property (weak, nonatomic) IBOutlet UILabel *acceleroStatusLabel;
@property (weak, nonatomic) IBOutlet UILabel *touchStatusLabel;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // For example, in viewDidLoad
    self.acceleroStatusLabel.numberOfLines = 0;
    self.acceleroStatusLabel.lineBreakMode = NSLineBreakByWordWrapping;

    self.touchStatusLabel.numberOfLines = 0;
    self.touchStatusLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    self.accelerometerManager = [[AccelerometerManager alloc] init];
    self.accelerometerManager.delegate = self;
    [self.accelerometerManager startListeningWithUpdateInterval:0.1];
    
    [self startListening];
   
}

- (void)dealloc {
    [self.accelerometerManager stopListening];
}


// Delegate method for receiving data
- (void)accelerometerManagerWith:(AccelerometerManager * _Nonnull)manager didReceiveData:(CMAccelerometerData * _Nonnull)data {
    _acceleroStatusLabel.text = [NSString stringWithFormat:@"ccelerometer data x: %.2f, y: %.2f, z: %.2f", data.acceleration.x, data.acceleration.y, data.acceleration.z];
    
    NSLog(@"Accelerometer data: x=%f, y=%f, z=%f", data.acceleration.x, data.acceleration.y, data.acceleration.z);
}

// Delegate method for error
- (void)accelerometerManagerWith:(AccelerometerManager * _Nonnull)manager didFailWithError:(enum AccelerometerListenerError)error {
    NSString *errorMessage = (long)error == 0 ? @"Accelerometer unavailable" :@"";
   
    _acceleroStatusLabel.text = [NSString stringWithFormat:@"Error: %@", errorMessage];
    NSLog(@"Accelerometer error: %@", errorMessage);
}


- (void)handleTouchEvent:(UIEvent *)event {
    // Generate the string
       NSString *eventDetails = [self stringForUIEventDetails:event inView:self.view];
       
       // Assign it to the label
       _touchStatusLabel.text = eventDetails;
       
       // Optional: also log to console if you want
       NSLog(@"%@", eventDetails);
//    _touchStatusLabel.text = [NSString stringWithFormat:@"MainViewController: handleTouchEvent called with even: %lu", (unsigned long)event.allTouches.count];
//    
//    printf(@"MainViewController: handleTouchEvent called with event: %@", event);

}

- (IBAction)StartAcceleroButtonTouched:(id)sender
{
    _acceleroStatusLabel.text = @"";
    [self.accelerometerManager startListeningWithUpdateInterval:0.1];
}

- (IBAction)StopAcceleroButtonTouched:(id)sender
{
    _acceleroStatusLabel.text = @"";
    [self.accelerometerManager stopListening];
}

- (IBAction)StartTouchButtonTouched:(id)sender
{
    _touchStatusLabel.text = @"";
    [self startListening];
}

- (IBAction)StopTouchButtonTouched:(id)sender
{
    _touchStatusLabel.text = @"";
    [self stopListening];
}

- (IBAction)LogoutButtonTouched:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


- (NSString *)stringForUIEventDetails:(UIEvent *)event inView:(UIView *)view {
    NSMutableString *logString = [NSMutableString string];
    
    [logString appendFormat:@"UIEvent details:\n type = %ld, subtype = %ld, timestamp = %f\n",
     (long)event.type,
     (long)event.subtype,
     event.timestamp];
    
    [logString appendFormat:@"Number of touches: %lu\n\n", (unsigned long)event.allTouches.count];
    
    NSUInteger index = 0;
    for (UITouch *touch in event.allTouches) {
        CGPoint location = [touch locationInView:view];
        CGPoint previousLocation = [touch previousLocationInView:view];
        
        NSString *phaseString = @"";
        switch (touch.phase) {
            case UITouchPhaseBegan: phaseString = @"Began"; break;
            case UITouchPhaseMoved: phaseString = @"Moved"; break;
            case UITouchPhaseStationary: phaseString = @"Stationary"; break;
            case UITouchPhaseEnded: phaseString = @"Ended"; break;
            case UITouchPhaseCancelled: phaseString = @"Cancelled"; break;
            default: phaseString = @"Unknown"; break;
        }
        
        [logString appendFormat:@"-- Touch %lu --\n", (unsigned long)index];
        [logString appendFormat:@"Phase: %@, tapCount: %lu\n", phaseString, (unsigned long)touch.tapCount];
        [logString appendFormat:@"Location in view: (%.2f, %.2f)\nPrevious location: (%.2f, %.2f)\n",
         location.x, location.y,
         previousLocation.x, previousLocation.y];
        [logString appendFormat:@"Touch timestamp: %f\n", touch.timestamp];
        [logString appendFormat:@"View: %@\n", touch.view];
        [logString appendFormat:@"Window: %@\n\n", touch.window];
        
        index++;
    }
    
    return logString;
}



@end
