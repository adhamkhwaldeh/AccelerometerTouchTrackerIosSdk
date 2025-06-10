//
//  LoginViewController.m
//  CodeExample
//

#import "LoginViewController.h"
#import "SampleApp.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *tfUsername;
@property (weak, nonatomic) IBOutlet UITextField *tfPassword;

@end

@implementation LoginViewController

SampleApp* sampleApp;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    sampleApp = [SampleApp sharedSampleApp];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [_tfUsername setText:@""];
    if (@available(iOS 12.0, *)) {
        [_tfUsername setTextContentType:UITextContentTypeOneTimeCode];
    }
    [_tfUsername setAutocorrectionType:UITextAutocorrectionTypeNo];
    [[_tfUsername inputAssistantItem] setLeadingBarButtonGroups:@[]];
    [[_tfUsername inputAssistantItem] setTrailingBarButtonGroups:@[]];
    [_tfUsername setDelegate:self];
    
    [_tfPassword setText:@""];
    [_tfPassword setSecureTextEntry:YES];
    if (@available(iOS 12.0, *)) {
        [_tfPassword setTextContentType:UITextContentTypeOneTimeCode];
    }
    [_tfPassword setAutocorrectionType:UITextAutocorrectionTypeNo];
    [[_tfPassword inputAssistantItem] setLeadingBarButtonGroups:@[]];
    [[_tfPassword inputAssistantItem] setTrailingBarButtonGroups:@[]];
    [_tfPassword setDelegate:self];
}

- (IBAction)SignInButtonTouched:(id)sender
{
    [self tryToLogin];
}

- (void) tryToLogin
{
    NSString* username = [_tfUsername text];
    NSString* password = [_tfPassword text];
    
    //TODO: Validate input: not empty, minimum length, etc.

    // Check credentials with the server
    [self checkCredentialsWithUsername:username andPassword:password];

    // Clean fields
    [_tfUsername setText:@""];
    [_tfPassword setText:@""];
}

- (void) checkCredentialsWithUsername:(NSString*)username andPassword:(NSString*)password
{
    // In a real app, this is done server-side. For this sample, we only accept the following:
    // username: behaviouser
    // password: password
    NSString* VALID_USERNAME = @"behaviouser";
    NSString* VALID_PASSWORD = @"password";
    
    if ([VALID_USERNAME isEqualToString:username] && [VALID_PASSWORD isEqualToString:password])
    {
        [self onLoginSuccessful];
    }
    else
    {
        [self onLoginFailed];
    }
}

// Callback method when entered credentials are correct
- (void) onLoginSuccessful
{
    // Move to next ViewController
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController* vc = [sb instantiateViewControllerWithIdentifier:@"sbIDMainViewController"];
    UINavigationController *nc = self.navigationController;
    [nc pushViewController:vc animated:YES];
}

// Callback method when entered credentials are not correct
- (void) onLoginFailed
{
    // Show wrong credentials dialog
    UIAlertController* alert = [UIAlertController
                                alertControllerWithTitle:[NSString stringWithFormat:NSLocalizedString(@"login_failed", nil)]
                                message:[NSString stringWithFormat:NSLocalizedString(@"login_failed_msg", nil)]
                                preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* defaultAction = [UIAlertAction
                                    actionWithTitle:[NSString stringWithFormat:NSLocalizedString(@"ok", nil)]
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action) {}];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];

    return;
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField {
    if (textField == _tfUsername) {
        [_tfPassword becomeFirstResponder];
        return NO;
    }
    else if (textField == _tfPassword) {
        [_tfPassword resignFirstResponder];
        [self tryToLogin];
        return NO;
    }
    return YES;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_tfUsername endEditing:YES];
    [_tfPassword endEditing:YES];
}

@end
