//
//  jjkViewController.h
//  NoteSecret
//
//  Created by Joshua Kuiros on 4/3/14.
//  Copyright (c) 2014 Joshua Kuiros. All rights reserved.
//

#import <UIKit/UIKit.h>
#include "jjkConstants.h"
#include "jjkKeychainWrapper.h"
#include "jjkChangeUsernameViewController.h"
#include "jjkChangePasswordViewController.h"

@interface jjkViewController : UIViewController
- (IBAction)unwindToLogin:(UIStoryboardSegue *)segue;
@end
