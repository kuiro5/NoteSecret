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
        //self.noteSecretArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (id)initWithJSONFromFile:(NSString *)jsonFileName
{
    self = [super init];
    if (self) {
        self.noteSecretArray = [self dataFromJSONFile:jsonFileName];
        //[self writeDefaultImageToDocuments];
    }
    return self;
}

// Helper method to get the data from the JSON file.
- (NSMutableArray *)dataFromJSONFile:(NSString *)jsonFileName
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *jsonPath = [documentsDirectory stringByAppendingPathComponent:jsonFileName];
    if ([[NSFileManager defaultManager] fileExistsAtPath:jsonPath]) {
        NSError* error = nil;
        NSData *responseData = [NSData dataWithContentsOfFile:jsonPath];
        NSDictionary* json = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
        return [[NSMutableArray alloc] initWithArray:[json objectForKey:@"gifts"]];
    }
    return  [[NSMutableArray alloc] init];
}

- (void)saveNoteList
{
    
    NSError *error = nil;
    // We wrap our Gifts array inside of a dictionary to follow the standard JSON format (you could keep it as an array).
    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObject:self.noteSecretArray forKey:@"notes"];
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:jsonDictionary
                                                       options:NSJSONWritingPrettyPrinted error:&error];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *jsonPath = [documentsDirectory stringByAppendingPathComponent:@"notes.json"];
    [jsonData writeToFile:jsonPath options:NSDataWritingFileProtectionComplete error:&error];
    [[NSFileManager defaultManager] setAttributes:[NSDictionary dictionaryWithObject:NSFileProtectionComplete forKey:NSFileProtectionKey] ofItemAtPath:jsonPath error:&error];
}

-(void)addNewNote:(NSString*)label noteContent:(NSString*)note
{
    NSDictionary *newNoteDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:label, @"NoteLabel", note, @"NoteContent", nil];
    
    [self.noteSecretArray addObject:newNoteDictionary];
    
    [self saveNoteList];
    
}

-(void)updateNote:(NSString*)label noteContent:(NSString*)note index:(NSIndexPath*)indexPath
{
    NSDictionary *updateNoteDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:label, @"NoteLabel", note, @"NoteContent", nil];
    
    [self.noteSecretArray replaceObjectAtIndex:indexPath.row withObject:updateNoteDictionary];
    
    [self saveNoteList];
    
}
@end
