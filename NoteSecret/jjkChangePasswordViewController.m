//
//  jjkChangePasswordViewController.m
//  NoteSecret
//
//  Created by Joshua Kuiros on 4/27/14.
//  Copyright (c) 2014 Joshua Kuiros. All rights reserved.
//

#import "jjkChangePasswordViewController.h"

@interface jjkChangePasswordViewController ()
@property (weak, nonatomic) IBOutlet UITextField *passwordNowTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordToChangeToTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordToChangeTextField;
- (IBAction)saveButtonPressed:(id)sender;
- (IBAction)cancelButtonPressed:(id)sender;

@end

@implementation jjkChangePasswordViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)saveButtonPressed:(id)sender {
    NSUInteger fieldHash = [self.passwordNowTextField.text hash]; // Get the hash of the entered PIN, minimize contact with the real password

    if([jjkKeychainWrapper compareKeychainValueForMatchingPIN:fieldHash]  && [self.passwordToChangeToTextField.text isEqualToString:self.confirmPasswordToChangeTextField.text])
    {
         NSUInteger newFieldHash = [self.passwordToChangeToTextField.text hash]; // Get the hash of the entered PIN, minimize contact with the real password
        NSString *newFieldString = [jjkKeychainWrapper securedSHA256DigestHashForPIN:newFieldHash];
        [jjkKeychainWrapper updateKeychainValue:newFieldString forIdentifier:PIN_SAVED];
        [[NSUserDefaults standardUserDefaults] synchronize];
        self.completionBlock(nil);
    }
    else
    {
        UIAlertView *newAlert = [[UIAlertView alloc] initWithTitle:@"Incorrect Password"
                                                           message:@"Please Try Again"
                                                          delegate:self
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil, nil];
        [newAlert show];
    }

}

- (IBAction)cancelButtonPressed:(id)sender {
    self.completionBlock(nil);
}
@end
