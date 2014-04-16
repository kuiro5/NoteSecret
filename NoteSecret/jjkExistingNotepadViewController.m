//
//  jjkExistingNotepadViewController.m
//  NoteSecret
//
//  Created by Joshua Kuiros on 4/16/14.
//  Copyright (c) 2014 Joshua Kuiros. All rights reserved.
//

#import "jjkExistingNotepadViewController.h"

@interface jjkExistingNotepadViewController ()
@property (weak, nonatomic) IBOutlet UITextView *existingContent;
@property (weak, nonatomic) IBOutlet UITextView *existingTitle;
- (IBAction)existingSave:(id)sender;
- (IBAction)existingCancel:(id)sender;

@end

@implementation jjkExistingNotepadViewController
-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        _model = [Model sharedInstance];
    }
    return self;
}

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

-(void)viewWillAppear:(BOOL)animated
{
    //self.existingContent.text = self.contentToPass;
    self.existingTitle.text = self.titleToPass;
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


- (IBAction)existingSave:(id)sender {
    self.completionBlock(nil);
}

- (IBAction)existingCancel:(id)sender {
    self.completionBlock(nil);
}
@end
