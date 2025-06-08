//
//  StartViewController.m
//  CodeExample
//

#import "StartViewController.h"
#import "SampleApp.h"

@interface StartViewController ()

@property (weak, nonatomic) IBOutlet UIButton *startButton;

@end

@implementation StartViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)StartButtonTouched:(id)sender
{  
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController* vc = [sb instantiateViewControllerWithIdentifier:@"sbIDLoginViewController"];
    UINavigationController *nc = self.navigationController;
    [nc pushViewController:vc animated:YES];
}

@end
