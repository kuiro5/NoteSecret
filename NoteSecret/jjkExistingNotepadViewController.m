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
    NSInteger temp = self.pathToLoad.row;
    NSDictionary *dictionaryToPass = [self.model.noteSecretArray objectAtIndex:temp];
    
    NSLog(@"VIEWDIDLOAD: %d", temp);
    
    self.existingContent.text = [dictionaryToPass objectForKey:@"NoteContent"];
    self.existingTitle.text = [dictionaryToPass objectForKey:@"NoteLabel"];
}

-(void)viewWillAppear:(BOOL)animated
{
    //self.existingContent.text = self.contentToPass;
    //self.existingTitle.text = self.titleToPass;
    
    NSInteger temp = self.pathToLoad.row;
    
    NSLog(@"VIEWILLAPPEAR: %d", temp);
    NSDictionary *dictionaryToPass = [self.model.noteSecretArray objectAtIndex:temp];
    
    self.existingContent.text = [dictionaryToPass objectForKey:@"NoteContent"];
    self.existingTitle.text = [dictionaryToPass objectForKey:@"NoteLabel"];
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
    
    [self.model updateNote:self.existingTitle.text noteContent:self.existingContent.text index:self.pathToLoad];
    self.completionBlock(nil);
}

- (IBAction)existingCancel:(id)sender {
    self.completionBlock(nil);
}
@end
