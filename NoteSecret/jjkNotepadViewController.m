//
//  jjkNotepadViewController.m
//  NoteSecret
//
//  Created by Joshua Kuiros on 4/4/14.
//  Copyright (c) 2014 Joshua Kuiros. All rights reserved.
//

#import "jjkNotepadViewController.h"

@interface jjkNotepadViewController ()
- (IBAction)saveButtonPressed:(id)sender;
- (IBAction)cancelButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *noteTitle;
@property (weak, nonatomic) IBOutlet UITextView *noteContent;

@end

@implementation jjkNotepadViewController

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
    NSString *string = @"";
    self.completionBlock(string);
}

- (IBAction)cancelButtonPressed:(id)sender {
    NSString *string = @"";
    self.completionBlock(string);
}
@end
