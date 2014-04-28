//
//  jjkViewController.h
//  NoteSecret
//
//  Created by Joshua Kuiros on 4/3/14.
//  Copyright (c) 2014 Joshua Kuiros. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "jjkConstants.h"
#import "jjkKeychainWrapper.h"
#import "jjkChangeUsernameViewController.h"
#import "jjkChangePasswordViewController.h"

@interface jjkViewController : UIViewController
- (IBAction)unwindToLogin:(UIStoryboardSegue *)segue;
@end
