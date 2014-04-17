//
//  jjkExistingNotepadViewController.h
//  NoteSecret
//
//  Created by Joshua Kuiros on 4/16/14.
//  Copyright (c) 2014 Joshua Kuiros. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

@interface jjkExistingNotepadViewController : UIViewController
//@property(strong, nonatomic)NSString *contentToPass;
//@property(strong, nonatomic)NSString *titleToPass;
@property (nonatomic,copy) CompletionBlock completionBlock;
@property (strong,nonatomic) Model *model;
@property(strong,nonatomic)NSIndexPath *pathToLoad;

@end

