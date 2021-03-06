//
//  jjkViewController.m
//  NoteSecret
//
//  Created by Joshua Kuiros on 4/3/14.
//  Copyright (c) 2014 Joshua Kuiros. All rights reserved.
//

#import "jjkViewController.h"
#import "jjkTableViewController.h"

@interface jjkViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
- (IBAction)submitPressed:(id)sender;
- (IBAction)clearPressed:(id)sender;
@property (nonatomic) BOOL pinValidated;
@end

@implementation jjkViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.pinValidated = NO;
}

// Helper method to congregate the Name and PIN fields for validation.
- (BOOL)credentialsValidated
{
    NSString *name = [[NSUserDefaults standardUserDefaults] stringForKey:USERNAME];
    BOOL pin = [[NSUserDefaults standardUserDefaults] boolForKey:PIN_SAVED];
    if (name && pin) {
        return YES;
    } else {
        return NO;
    }
}

-(BOOL)textFieldShouldReturn:(UITextField*)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self presentAlertViewForPassword];
}

- (IBAction)unwindToLogin:(UIStoryboardSegue *)segue
{
    // Do something after unwinding
}

- (void)presentAlertViewForPassword
{
    
    // 1
    BOOL hasPin = [[NSUserDefaults standardUserDefaults] boolForKey:PIN_SAVED];
    
    // 2
//    if (hasPin) {
//        // 3
//        NSString *user = [[NSUserDefaults standardUserDefaults] stringForKey:USERNAME];
//        NSString *message = [NSString stringWithFormat:@"What is %@'s password?", user];
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Enter Password"
//                                                        message:message
//                                                       delegate:self
//                                              cancelButtonTitle:@"Cancel"
//                                              otherButtonTitles:@"Done", nil];
//        // 4
//        [alert setAlertViewStyle:UIAlertViewStyleSecureTextInput]; // Gives us the password field
//        alert.tag = kAlertTypePIN;
//        // 5
//        UITextField *pinField = [alert textFieldAtIndex:0];
//        pinField.delegate = self;
//        pinField.autocapitalizationType = UITextAutocapitalizationTypeWords;
//        pinField.tag = kTextFieldPIN;
//        [alert show];
//    }
        if(!hasPin) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Setup Credentials"
                                                        message:@"Password must be at least 8 characters."
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"Done", nil];
        // 6
        [alert setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];
        alert.tag = kAlertTypeSetup;
        UITextField *nameField = [alert textFieldAtIndex:0];
        nameField.autocapitalizationType = UITextAutocapitalizationTypeWords;
        nameField.placeholder = @"Name"; // Replace the standard placeholder text with something more applicable
        nameField.delegate = self;
        nameField.tag = kTextFieldName;
        UITextField *passwordField = [alert textFieldAtIndex:1]; // Capture the Password text field since there are 2 fields
        passwordField.delegate = self;
        passwordField.tag = kTextFieldPassword;
        [alert show];
    }
}

#pragma mark - Text Field + Alert View Methods
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    // 1
    switch (textField.tag) {
//        case kTextFieldPIN: // We go here if this is the 2nd+ time used (we've already set a PIN at Setup).
//            NSLog(@"User entered PIN to validate");
//            if ([textField.text length] > 0) {
//                // 2
//                NSUInteger fieldHash = [textField.text hash]; // Get the hash of the entered PIN, minimize contact with the real password
//                // 3
//                if ([jjkKeychainWrapper compareKeychainValueForMatchingPIN:fieldHash]) { // Compare them
//                    NSLog(@"** User Authenticated!!");
//                    self.pinValidated = YES;
//                } else {
//                    NSLog(@"** Wrong Password :(");
//                    self.pinValidated = NO;
//                }
//            }
//            break;
        case kTextFieldName: // 1st part of the Setup flow.
            NSLog(@"User entered name");
            if ([textField.text length] > 0) {
                [[NSUserDefaults standardUserDefaults] setValue:textField.text forKey:USERNAME];
                [[NSUserDefaults standardUserDefaults] synchronize];
            }
            break;
        case kTextFieldPassword: // 2nd half of the Setup flow.
            NSLog(@"User entered PIN");
            if ([textField.text length] > 0) {
                NSUInteger fieldHash = [textField.text hash];
                // 4
                NSString *fieldString = [jjkKeychainWrapper securedSHA256DigestHashForPIN:fieldHash];
                NSLog(@"** Password Hash - %@", fieldString);
                // Save PIN hash to the keychain (NEVER store the direct PIN)
                if ([jjkKeychainWrapper createKeychainValue:fieldString forIdentifier:PIN_SAVED]) {
                    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:PIN_SAVED];
                    [[NSUserDefaults standardUserDefaults] synchronize];
                    NSLog(@"** Key saved successfully to Keychain!!");
                }
            }
            break;
        default:
            break;
    }
}


- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == kAlertTypePIN) {
        if (buttonIndex == 1 && self.pinValidated) { // User selected "Done"
            //[self performSegueWithIdentifier:@"ChristmasTableSegue" sender:self];
            self.pinValidated = NO;
        } else { // User selected "Cancel"
            [self presentAlertViewForPassword];
        }
    } else if (alertView.tag == kAlertTypeSetup) {
        if (buttonIndex == 1 && [self credentialsValidated]) { // User selected "Done"
            //[self performSegueWithIdentifier:@"ChristmasTableSegue" sender:self];
        } else { // User selected "Cancel"
            [self presentAlertViewForPassword];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if(self.pinValidated || ![identifier isEqualToString:@"ValidatedSegue"])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PasswordSegue"])
    {
        jjkChangePasswordViewController *passwordViewController = segue.destinationViewController;
        passwordViewController.completionBlock = ^(id obj) {
            [self dismissViewControllerAnimated:YES completion:NULL];
            if (obj) {
                //NSDictionary *dictionary = obj;
                //[self.myDataManager addBuilding:dictionary];
            }
        };
    }
    else if ([segue.identifier isEqualToString:@"UsernameSegue"])
    {
        jjkChangeUsernameViewController *usernameViewController = segue.destinationViewController;
        usernameViewController.completionBlock = ^(id obj) {
            [self dismissViewControllerAnimated:YES completion:NULL];
            if (obj) {
                //NSDictionary *dictionary = obj;
                //[self.myDataManager addBuilding:dictionary];
            }
        };
    }



}

- (IBAction)submitPressed:(id)sender {
    
    if ([self.passwordTextField.text length] > 0 && [self.usernameTextField.text length] > 0) {
        // 2
        NSUInteger fieldHash = [self.passwordTextField.text hash]; // Get the hash of the entered PIN, minimize contact with the real password
         NSString *user = [[NSUserDefaults standardUserDefaults] stringForKey:USERNAME];
        // 3
        if ([jjkKeychainWrapper compareKeychainValueForMatchingPIN:fieldHash] && [self.usernameTextField.text isEqualToString:(user)]) { // Compare them
            NSLog(@"** User Authenticated!!");
            self.pinValidated = YES;
            [self performSegueWithIdentifier:@"ValidatedSegue" sender:self];
        } else {
            NSLog(@"** Wrong Password :(");
            self.pinValidated = NO;
            
            UIAlertView *newAlert = [[UIAlertView alloc] initWithTitle:@"Incorrect Username/Password"
                                                               message:@"Please Try Again"
                                                              delegate:self
                                                     cancelButtonTitle:@"OK"
                                                     otherButtonTitles:nil, nil];
            [newAlert show];
        }
    }

}

- (IBAction)clearPressed:(id)sender {
    self.usernameTextField.text = @"";
    self.passwordTextField.text = @"";
}
@end
