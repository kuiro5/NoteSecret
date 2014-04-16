//
//  Model.h
//  NoteSecret
//
//  Created by Joshua Kuiros on 4/16/14.
//  Copyright (c) 2014 Joshua Kuiros. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

//@property(strong, nonatomic) NSMutableDictionary *noteSecretDictioanry;
@property(strong, nonatomic)NSMutableArray *noteSecretArray;
+(id)sharedInstance;
-(void)addNewNote:(NSString*)label noteContent:(NSString*)note;

@end
