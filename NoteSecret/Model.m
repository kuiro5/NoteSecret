//
//  Model.m
//  NoteSecret
//
//  Created by Joshua Kuiros on 4/16/14.
//  Copyright (c) 2014 Joshua Kuiros. All rights reserved.
//

#import "Model.h"

@implementation Model
+(id)sharedInstance
{
    static id singleton = nil;
    if (!singleton)
    {
        singleton = [[self alloc] init];
    }
    return singleton;
}

-(id) init
{
    self = [super init];
    if(self)
    {
        // initialization
        //self.noteSecretDictioanry = [[NSMutableDictionary alloc] init];
        self.noteSecretArray = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)addNewNote:(NSString*)label noteContent:(NSString*)note
{
    NSDictionary *newNoteDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:label, @"NoteLabel", note, @"NoteContent", nil];
    
    [self.noteSecretArray addObject:newNoteDictionary];
    
}
@end
