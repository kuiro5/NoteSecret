//
//  jjkNotepadViewController.h
//  NoteSecret
//
//  Created by Joshua Kuiros on 4/4/14.
//  Copyright (c) 2014 Joshua Kuiros. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

@interface jjkNotepadViewController : UIViewController
@property (nonatomic,copy) CompletionBlock completionBlock;
@property (strong,nonatomic) Model *model;
@end
