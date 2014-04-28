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
    self.completionBlock(nil);
}

- (IBAction)cancelButtonPressed:(id)sender {
    self.completionBlock(nil);
}
@end
