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

@end

@implementation jjkViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    jjkTableViewController *tableViewController = segue.destinationViewController;
    //noteTableViewController.delegate = self;

}

@end
